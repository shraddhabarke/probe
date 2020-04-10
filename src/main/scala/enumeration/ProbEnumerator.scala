package enumeration

import ast.{ASTNode, VocabFactory, VocabMaker}
import trace.DebugPrints.dprintln
import java.io.{File, FileOutputStream}

import sygus.SygusFileTask

import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

class ProbEnumerator(val vocab: VocabFactory, val oeManager: OEValuesManager, val task: SygusFileTask) extends Iterator[ASTNode] {
  override def toString(): String = "enumeration.Enumerator"

  var nextProgram: Option[ASTNode] = None

  override def hasNext: Boolean = if (!nextProgram.isEmpty) true
  else {
    nextProgram = getNextProgram()
    !nextProgram.isEmpty
  }

  override def next(): ASTNode = {
    if (nextProgram.isEmpty) {
      nextProgram = getNextProgram()
    }
    val res = nextProgram.get
    nextProgram = None
    res
  }

  var currIter: Iterator[VocabMaker] = null
  var childrenIterator: Iterator[List[ASTNode]] = null
  var currLevelProgs: mutable.ArrayBuffer[ASTNode] = mutable.ArrayBuffer()
  var bank = scala.collection.mutable.Map[Int, mutable.ArrayBuffer[ASTNode]]()
  val fos = new FileOutputStream(new File("out.txt"))
  var fits = Set[Set[Any]]()
  var costLevel = 10
  resetEnumeration()
  var rootMaker: VocabMaker = currIter.next()

  def resetEnumeration():  Unit = {
    currIter = vocab.leaves().toList.sortBy(_.rootCost).toIterator
    childrenIterator = Iterator.single(Nil)
    currLevelProgs.clear()
    oeManager.clear()
    bank.clear()
  }

  def advanceRoot(): Boolean = {
    if (!currIter.hasNext) return false
    rootMaker = currIter.next()
    val rootCost = rootMaker.rootCost
    if (rootMaker.arity == 0)
      childrenIterator = Iterator.single(Nil)
    else if (rootCost < costLevel) {
      val childrenCost = costLevel - rootCost
      childrenIterator = new ProbChildrenIterator(rootMaker.childTypes, childrenCost, bank)
    }
    true
  }

  def updateBank(program: ASTNode): Unit = {
    if (!bank.contains(program.cost))
      bank(program.cost) = ArrayBuffer(program)
    else
      bank(program.cost) += program
  }

  def changeLevel(): Boolean = {
    currIter = vocab.nonLeaves.toList.sortBy(_.rootCost).toIterator
    val changed = ProbUpdate.updatePriors(fits, currLevelProgs, task)
    currLevelProgs.map(c => updateBank(c))
    if (changed) {
      resetEnumeration()
      costLevel = 0
    }
    fits = ProbUpdate.fitExamples
    costLevel += 1
    currLevelProgs.clear()
    advanceRoot()
  }

  def getNextProgram(): Option[ASTNode] = {
    var res: Option[ASTNode] = None
    while (res.isEmpty) {
      if (childrenIterator.hasNext) {
        val children = childrenIterator.next()
        if (rootMaker.canMake(children)) {
          val prog = rootMaker(children, task.examples.map(_.input))
          if (oeManager.isRepresentative(prog))
            res = Some(prog)
        }
      }
      else if (currIter.hasNext) {
        if (!advanceRoot())
          return None
      }
      else {
        if (!changeLevel())
          return None
      }
    }
    currLevelProgs += res.get
    Console.withOut(fos) { dprintln(currLevelProgs.takeRight(4).map(_.code).mkString(",")) }
    //dprintln(currLevelProgs.takeRight(4).map(_.code).mkString(","))
    res
  }
}

