package com.seecen.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class TeacherExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TeacherExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andTnoIsNull() {
            addCriterion("TNO is null");
            return (Criteria) this;
        }

        public Criteria andTnoIsNotNull() {
            addCriterion("TNO is not null");
            return (Criteria) this;
        }

        public Criteria andTnoEqualTo(Integer value) {
            addCriterion("TNO =", value, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoNotEqualTo(Integer value) {
            addCriterion("TNO <>", value, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoGreaterThan(Integer value) {
            addCriterion("TNO >", value, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoGreaterThanOrEqualTo(Integer value) {
            addCriterion("TNO >=", value, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoLessThan(Integer value) {
            addCriterion("TNO <", value, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoLessThanOrEqualTo(Integer value) {
            addCriterion("TNO <=", value, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoIn(List<Integer> values) {
            addCriterion("TNO in", values, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoNotIn(List<Integer> values) {
            addCriterion("TNO not in", values, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoBetween(Integer value1, Integer value2) {
            addCriterion("TNO between", value1, value2, "tno");
            return (Criteria) this;
        }

        public Criteria andTnoNotBetween(Integer value1, Integer value2) {
            addCriterion("TNO not between", value1, value2, "tno");
            return (Criteria) this;
        }

        public Criteria andTnameIsNull() {
            addCriterion("TNAME is null");
            return (Criteria) this;
        }

        public Criteria andTnameIsNotNull() {
            addCriterion("TNAME is not null");
            return (Criteria) this;
        }

        public Criteria andTnameEqualTo(String value) {
            addCriterion("TNAME =", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotEqualTo(String value) {
            addCriterion("TNAME <>", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameGreaterThan(String value) {
            addCriterion("TNAME >", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameGreaterThanOrEqualTo(String value) {
            addCriterion("TNAME >=", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLessThan(String value) {
            addCriterion("TNAME <", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLessThanOrEqualTo(String value) {
            addCriterion("TNAME <=", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLike(String value) {
            addCriterion("TNAME like", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotLike(String value) {
            addCriterion("TNAME not like", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameIn(List<String> values) {
            addCriterion("TNAME in", values, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotIn(List<String> values) {
            addCriterion("TNAME not in", values, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameBetween(String value1, String value2) {
            addCriterion("TNAME between", value1, value2, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotBetween(String value1, String value2) {
            addCriterion("TNAME not between", value1, value2, "tname");
            return (Criteria) this;
        }

        public Criteria andTsexIsNull() {
            addCriterion("TSEX is null");
            return (Criteria) this;
        }

        public Criteria andTsexIsNotNull() {
            addCriterion("TSEX is not null");
            return (Criteria) this;
        }

        public Criteria andTsexEqualTo(String value) {
            addCriterion("TSEX =", value, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexNotEqualTo(String value) {
            addCriterion("TSEX <>", value, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexGreaterThan(String value) {
            addCriterion("TSEX >", value, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexGreaterThanOrEqualTo(String value) {
            addCriterion("TSEX >=", value, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexLessThan(String value) {
            addCriterion("TSEX <", value, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexLessThanOrEqualTo(String value) {
            addCriterion("TSEX <=", value, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexLike(String value) {
            addCriterion("TSEX like", value, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexNotLike(String value) {
            addCriterion("TSEX not like", value, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexIn(List<String> values) {
            addCriterion("TSEX in", values, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexNotIn(List<String> values) {
            addCriterion("TSEX not in", values, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexBetween(String value1, String value2) {
            addCriterion("TSEX between", value1, value2, "tsex");
            return (Criteria) this;
        }

        public Criteria andTsexNotBetween(String value1, String value2) {
            addCriterion("TSEX not between", value1, value2, "tsex");
            return (Criteria) this;
        }

        public Criteria andTbirthdayIsNull() {
            addCriterion("TBIRTHDAY is null");
            return (Criteria) this;
        }

        public Criteria andTbirthdayIsNotNull() {
            addCriterion("TBIRTHDAY is not null");
            return (Criteria) this;
        }

        public Criteria andTbirthdayEqualTo(Date value) {
            addCriterionForJDBCDate("TBIRTHDAY =", value, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayNotEqualTo(Date value) {
            addCriterionForJDBCDate("TBIRTHDAY <>", value, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayGreaterThan(Date value) {
            addCriterionForJDBCDate("TBIRTHDAY >", value, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("TBIRTHDAY >=", value, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayLessThan(Date value) {
            addCriterionForJDBCDate("TBIRTHDAY <", value, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("TBIRTHDAY <=", value, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayIn(List<Date> values) {
            addCriterionForJDBCDate("TBIRTHDAY in", values, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayNotIn(List<Date> values) {
            addCriterionForJDBCDate("TBIRTHDAY not in", values, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("TBIRTHDAY between", value1, value2, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTbirthdayNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("TBIRTHDAY not between", value1, value2, "tbirthday");
            return (Criteria) this;
        }

        public Criteria andTprofIsNull() {
            addCriterion("TPROF is null");
            return (Criteria) this;
        }

        public Criteria andTprofIsNotNull() {
            addCriterion("TPROF is not null");
            return (Criteria) this;
        }

        public Criteria andTprofEqualTo(String value) {
            addCriterion("TPROF =", value, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofNotEqualTo(String value) {
            addCriterion("TPROF <>", value, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofGreaterThan(String value) {
            addCriterion("TPROF >", value, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofGreaterThanOrEqualTo(String value) {
            addCriterion("TPROF >=", value, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofLessThan(String value) {
            addCriterion("TPROF <", value, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofLessThanOrEqualTo(String value) {
            addCriterion("TPROF <=", value, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofLike(String value) {
            addCriterion("TPROF like", value, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofNotLike(String value) {
            addCriterion("TPROF not like", value, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofIn(List<String> values) {
            addCriterion("TPROF in", values, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofNotIn(List<String> values) {
            addCriterion("TPROF not in", values, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofBetween(String value1, String value2) {
            addCriterion("TPROF between", value1, value2, "tprof");
            return (Criteria) this;
        }

        public Criteria andTprofNotBetween(String value1, String value2) {
            addCriterion("TPROF not between", value1, value2, "tprof");
            return (Criteria) this;
        }

        public Criteria andTdepartIsNull() {
            addCriterion("TDEPART is null");
            return (Criteria) this;
        }

        public Criteria andTdepartIsNotNull() {
            addCriterion("TDEPART is not null");
            return (Criteria) this;
        }

        public Criteria andTdepartEqualTo(String value) {
            addCriterion("TDEPART =", value, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartNotEqualTo(String value) {
            addCriterion("TDEPART <>", value, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartGreaterThan(String value) {
            addCriterion("TDEPART >", value, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartGreaterThanOrEqualTo(String value) {
            addCriterion("TDEPART >=", value, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartLessThan(String value) {
            addCriterion("TDEPART <", value, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartLessThanOrEqualTo(String value) {
            addCriterion("TDEPART <=", value, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartLike(String value) {
            addCriterion("TDEPART like", value, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartNotLike(String value) {
            addCriterion("TDEPART not like", value, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartIn(List<String> values) {
            addCriterion("TDEPART in", values, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartNotIn(List<String> values) {
            addCriterion("TDEPART not in", values, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartBetween(String value1, String value2) {
            addCriterion("TDEPART between", value1, value2, "tdepart");
            return (Criteria) this;
        }

        public Criteria andTdepartNotBetween(String value1, String value2) {
            addCriterion("TDEPART not between", value1, value2, "tdepart");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}