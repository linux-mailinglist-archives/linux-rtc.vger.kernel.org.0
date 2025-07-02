Return-Path: <linux-rtc+bounces-4406-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F21AF0D67
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 10:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56FCA1713A1
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 08:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4737B22A1E1;
	Wed,  2 Jul 2025 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awSuFaBp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FEC4C7F;
	Wed,  2 Jul 2025 08:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443275; cv=none; b=tf5i+znWuKT/IN3nRbfnY63wRyznZ63ypyWxCF8ElGZV820Ju1KfJxeFAddle1tk7Z3l93nRGrTvRsHP1xEpJyAwQ2ay/3zDgj1HHM9fm2OvQln2LgE1RSEMCPqh+1zDFAvxfKCVPYHuul8g2aDsp78pvXc4AkzEOJyLxtl/1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443275; c=relaxed/simple;
	bh=o/beQO41xS5a7XgcnZeothK7b/popVg22tt0/+I5ea4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qiOECgB8sj9BqoYqmK7LQ2VzNtvpAGIJpCTYeUgPcUlzh634XMJ9nLfjFzLa1yPrm03wj8+HK6SlDGiRwBK/TNzu2tHo6LNqVfLeHJBJOp5iIc4We8uTu+HfVjiPmQzEfOV/pfLQrD/D21hV/nHG9PEnvbfh+DiFcBPBxPwffIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awSuFaBp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751443274; x=1782979274;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o/beQO41xS5a7XgcnZeothK7b/popVg22tt0/+I5ea4=;
  b=awSuFaBp/qFQO1TknEj4dL9k/NUok6E+bDI7eZ/i0uZPvGbDbDnsORAx
   5JrQahhY6FqaGIqLXmbk629mMMyy1SXeyiPrcbDF28H7O8uxugyu4dZDy
   FV+JKgfprhe8rT5xCQLIiKSU7jg/z+OT0jn2N1jZl64VNZGad+fIjHLtw
   lv7WIsgeJXIMxoKbWnpUl8lrqwsha+aUdsC0u+vGqdvOkej/wJHaQtFRI
   RkMItgrIJCHAiguxjIkPJ8+o0Xuw6o/23+gamIz6VoHXSicGDkMkug0PE
   XwhwEpio69UMaHgEqNbT0uuIZlrd6qFAsVwGz8nKIEFKh7TgaPmjq3f6b
   A==;
X-CSE-ConnectionGUID: VKHo0g2XSL6kb4wFgycgRQ==
X-CSE-MsgGUID: evi3SuJ3RseoNfDR4dbZdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65077682"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="65077682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:01:13 -0700
X-CSE-ConnectionGUID: OBbdimyHQVyPQprEivO4Fw==
X-CSE-MsgGUID: hjg2Q9CpSM6kt481Ip4ZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153468910"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2025 01:01:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3CC921E0; Wed, 02 Jul 2025 11:01:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v1 1/1] rtc: sysfs: use __ATTRIBUTE_GROUPS()
Date: Wed,  2 Jul 2025 11:01:08 +0300
Message-ID: <20250702080108.2722905-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Embrace __ATTRIBUTE_GROUPS() to avoid boiler plate code.
This should not introduce any functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/rtc/sysfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
index 86d1140b4f39..2230241285d0 100644
--- a/drivers/rtc/sysfs.c
+++ b/drivers/rtc/sysfs.c
@@ -298,11 +298,7 @@ static struct attribute_group rtc_attr_group = {
 	.is_visible	= rtc_attr_is_visible,
 	.attrs		= rtc_attrs,
 };
-
-static const struct attribute_group *rtc_attr_groups[] = {
-	&rtc_attr_group,
-	NULL
-};
+__ATTRIBUTE_GROUPS(rtc_attr);
 
 const struct attribute_group **rtc_get_dev_attribute_groups(void)
 {
-- 
2.47.2


