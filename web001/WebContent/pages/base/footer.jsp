<script>
var oldLogDataStr = "";
//旧数据 日志
<c:if test="${!empty oldLogDataJson}">
var oldLogDataJson = ${oldLogDataJson}
var oldLogDataStr = JSON.stringify(oldLogDataJson);
</c:if>
</script>

</body>
</html>