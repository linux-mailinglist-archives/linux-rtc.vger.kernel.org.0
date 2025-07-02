Return-Path: <linux-rtc+bounces-4404-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD27AF0B63
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 08:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D49A3ABFB1
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 06:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6C519D8A7;
	Wed,  2 Jul 2025 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrPq+Qs/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFC423B0;
	Wed,  2 Jul 2025 06:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436940; cv=none; b=cnduTnUzf3Bu5dkoVnhiIEGAPyu5jzq/x/gyhiRFkTVA42rtlrABl4U7rQKXON5OUkSDh7kfJMShzE13jB5t8SRH/s3TClJHIsDf+j1usITxAqHWrXxd5XH3bDqOwftJ6pEWhWbmoHxChe5V4t/pIceJP3hVhsjwfsyFBemEOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436940; c=relaxed/simple;
	bh=gCu1jxN/NFwCAtV+RQx+DlO0eaegLgf+Ut8TFgxiEFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JnB+ZEzWwEyJCyp+QWcq0fGEPW691qdvECfg8H+JofwzeQf2LfSw3RXztQW73ebwFSHIoIkCbFlwF4t8aroXAdXfDzV0BATn3Gh77OuslNvaboQ4Zm6y9TzVDk9iJrvS5jw+V9aU6Z3OKmH3UIkLXPY9vMgS3weWRyqKLiRD1oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrPq+Qs/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751436939; x=1782972939;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gCu1jxN/NFwCAtV+RQx+DlO0eaegLgf+Ut8TFgxiEFE=;
  b=BrPq+Qs/4GJ0PKUaPI6Yxe14cxhjA7mE/+qRdyUFq5o7cxtYsVaAplmi
   JKdyVtyK8cb3KfWAOHld5Rv0DuMEK1j3ZAEGs7XwC5GxnZk2bsxxtRTmC
   CNXz068JPFxFWqAZXDB6eGXm9XDnpySjbmesW9yxTRzlyVXhGFNRhUc2w
   UtnoaSuy1QjqDMvU/WqOkMOjzZpeoBWEhUWe9MG8uhYm+uR8dNL5a5ZC1
   vwfUpO4U5+grt7m4UyIOv0ftA8CsijggTe/wCYNV+MmxLYZPv3iWf1Wd9
   LYXttqLLvs6WR5g5Z46rFlRcfu+otviNVstb+Y3+ZgfsrFpshpu5fTvML
   A==;
X-CSE-ConnectionGUID: aD8lcG5WQ7OjC0Msqkcq8g==
X-CSE-MsgGUID: +OE9MWc4SfSfsKSAo3hw0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52837332"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52837332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:15:38 -0700
X-CSE-ConnectionGUID: 1R9ljUyBQvmDNdFslkUxFA==
X-CSE-MsgGUID: HRGx1J+gST6SBSSHXvfe0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158362622"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 01 Jul 2025 23:15:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EF8981E0; Wed, 02 Jul 2025 09:15:34 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v1 1/1] rtc: sysfs: Use sysfs_emit() to instead of s*printf()
Date: Wed,  2 Jul 2025 09:15:34 +0300
Message-ID: <20250702061534.2670729-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the advice of the Documentation/filesystems/sysfs.rst that show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the value
to be returned to user space.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/rtc/sysfs.c | 46 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
index e3062c4d3f2c..86d1140b4f39 100644
--- a/drivers/rtc/sysfs.c
+++ b/drivers/rtc/sysfs.c
@@ -24,8 +24,8 @@
 static ssize_t
 name_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s %s\n", dev_driver_string(dev->parent),
-		       dev_name(dev->parent));
+	return sysfs_emit(buf, "%s %s\n", dev_driver_string(dev->parent),
+			  dev_name(dev->parent));
 }
 static DEVICE_ATTR_RO(name);
 
@@ -39,7 +39,7 @@ date_show(struct device *dev, struct device_attribute *attr, char *buf)
 	if (retval)
 		return retval;
 
-	return sprintf(buf, "%ptRd\n", &tm);
+	return sysfs_emit(buf, "%ptRd\n", &tm);
 }
 static DEVICE_ATTR_RO(date);
 
@@ -53,7 +53,7 @@ time_show(struct device *dev, struct device_attribute *attr, char *buf)
 	if (retval)
 		return retval;
 
-	return sprintf(buf, "%ptRt\n", &tm);
+	return sysfs_emit(buf, "%ptRt\n", &tm);
 }
 static DEVICE_ATTR_RO(time);
 
@@ -64,21 +64,17 @@ since_epoch_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct rtc_time tm;
 
 	retval = rtc_read_time(to_rtc_device(dev), &tm);
-	if (retval == 0) {
-		time64_t time;
+	if (retval)
+		return retval;
 
-		time = rtc_tm_to_time64(&tm);
-		retval = sprintf(buf, "%lld\n", time);
-	}
-
-	return retval;
+	return sysfs_emit(buf, "%lld\n", rtc_tm_to_time64(&tm));
 }
 static DEVICE_ATTR_RO(since_epoch);
 
 static ssize_t
 max_user_freq_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d\n", to_rtc_device(dev)->max_user_freq);
+	return sysfs_emit(buf, "%d\n", to_rtc_device(dev)->max_user_freq);
 }
 
 static ssize_t
@@ -118,9 +114,9 @@ hctosys_show(struct device *dev, struct device_attribute *attr, char *buf)
 	if (rtc_hctosys_ret == 0 &&
 	    strcmp(dev_name(&to_rtc_device(dev)->dev),
 		   CONFIG_RTC_HCTOSYS_DEVICE) == 0)
-		return sprintf(buf, "1\n");
+		return sysfs_emit(buf, "1\n");
 #endif
-	return sprintf(buf, "0\n");
+	return sysfs_emit(buf, "0\n");
 }
 static DEVICE_ATTR_RO(hctosys);
 
@@ -128,7 +124,6 @@ static ssize_t
 wakealarm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	ssize_t retval;
-	time64_t alarm;
 	struct rtc_wkalrm alm;
 
 	/* Don't show disabled alarms.  For uniformity, RTC alarms are
@@ -140,12 +135,13 @@ wakealarm_show(struct device *dev, struct device_attribute *attr, char *buf)
 	 * alarms after they trigger, to ensure one-shot semantics.
 	 */
 	retval = rtc_read_alarm(to_rtc_device(dev), &alm);
-	if (retval == 0 && alm.enabled) {
-		alarm = rtc_tm_to_time64(&alm.time);
-		retval = sprintf(buf, "%lld\n", alarm);
-	}
+	if (retval)
+		return retval;
 
-	return retval;
+	if (alm.enabled)
+		return sysfs_emit(buf, "%lld\n", rtc_tm_to_time64(&alm.time));
+
+	return 0;
 }
 
 static ssize_t
@@ -222,10 +218,10 @@ offset_show(struct device *dev, struct device_attribute *attr, char *buf)
 	long offset;
 
 	retval = rtc_read_offset(to_rtc_device(dev), &offset);
-	if (retval == 0)
-		retval = sprintf(buf, "%ld\n", offset);
+	if (retval)
+		return retval;
 
-	return retval;
+	return sysfs_emit(buf, "%ld\n", offset);
 }
 
 static ssize_t
@@ -246,8 +242,8 @@ static DEVICE_ATTR_RW(offset);
 static ssize_t
 range_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	return sprintf(buf, "[%lld,%llu]\n", to_rtc_device(dev)->range_min,
-		       to_rtc_device(dev)->range_max);
+	return sysfs_emit(buf, "[%lld,%llu]\n", to_rtc_device(dev)->range_min,
+			  to_rtc_device(dev)->range_max);
 }
 static DEVICE_ATTR_RO(range);
 
-- 
2.47.2


