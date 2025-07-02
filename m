Return-Path: <linux-rtc+bounces-4405-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911CAF0CA5
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 09:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 789F01BC3BF4
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 07:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1023223DC1;
	Wed,  2 Jul 2025 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJNeMlUz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE981C32;
	Wed,  2 Jul 2025 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751441549; cv=none; b=qINIRLgTDC3AHTa3uBza/yU1aaRxY0ajyRPge+7ArxCIgGggBB1An6+8P58ZH29o4pFdbDFSiZXV6CzzQYPfNXOJOP/Cz/fwg+v1Y2QuNsDZu1l1o1LEzocuSa6PdIrGQIt6Kk91pP8oEklBBIeNBca/DceMcojCFk5b6yuaOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751441549; c=relaxed/simple;
	bh=C6vdV3PJ6f+/jeBM4PBMXhFjt8DmlqhTvhOs5FQ68DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UT2WPlgLKgzGDcoMo6ZsjTWpKGwBrIyvap4QhJW5Mdoe8qvm1Kxrq92/N3Lubc+Du/hg0eVoyTcIxv+asSYO/4M6X9g6H3/hCWcmcNVFz1QxmGr1g9y3rOaHECeCU9p3yVnRFsWzVSec4Zd0R+kfAs3Bsr8SZMsJbLhnZ+da+eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJNeMlUz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751441549; x=1782977549;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C6vdV3PJ6f+/jeBM4PBMXhFjt8DmlqhTvhOs5FQ68DE=;
  b=cJNeMlUzcgBhvuIonQs/IwtqlzQkJyDrbHXocdyxGX1Z0F9zJQw4Vg0E
   pLXMxZS5gz1xmt/Bdkp/lbVfNocgI15d6pdmTMISMuvaFEEBLk3HkfDee
   xO1fB5qypsq99zFjbgBAYpmZKMGF2yZAOLfJ6E4Ug/tQIpzLJkn2mEi0h
   oVXiGUA//fH0gDv0gynaiifgXoQpxT3BT6GG1WAxMCBQUWLDwh0iNlHDi
   sYQCFIJ0ambPSvQQdqzNdU/gcMZpyrBZnbDBf/Qrd9uqPYfnhgHTbVn5d
   Kglk7Q7bRuB7jAiM2RNuLagYbxMWDUkCFlzx1uayaQcp+JFPYi70ax7d1
   Q==;
X-CSE-ConnectionGUID: GqIGVbJGRrKrna9GmRk3BA==
X-CSE-MsgGUID: Am2MNFOiSKWckiM75Lanuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53589982"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53589982"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 00:32:28 -0700
X-CSE-ConnectionGUID: vhikt/q1QJanlNulah5QTQ==
X-CSE-MsgGUID: MfZmcR+STbqsisB9E2a9PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153630489"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2025 00:32:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EC0631E0; Wed, 02 Jul 2025 10:32:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v1 1/1] rtc: sysfs: Bail out earlier if no new groups provided
Date: Wed,  2 Jul 2025 10:32:24 +0300
Message-ID: <20250702073224.2684097-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When there is no new groups provided, no need to reallocate memory,
copy the old ones and free them in order to do nothing. Do nothing
instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/rtc/sysfs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
index 2230241285d0..4ab05e105a76 100644
--- a/drivers/rtc/sysfs.c
+++ b/drivers/rtc/sysfs.c
@@ -310,17 +310,21 @@ int rtc_add_groups(struct rtc_device *rtc, const struct attribute_group **grps)
 	size_t old_cnt = 0, add_cnt = 0, new_cnt;
 	const struct attribute_group **groups, **old;
 
-	if (!grps)
+	if (grps) {
+		for (groups = grps; *groups; groups++)
+			add_cnt++;
+		/* No need to modify current groups if nothing new is provided */
+		if (add_cnt == 0)
+			return 0;
+	} else {
 		return -EINVAL;
+	}
 
 	groups = rtc->dev.groups;
 	if (groups)
 		for (; *groups; groups++)
 			old_cnt++;
 
-	for (groups = grps; *groups; groups++)
-		add_cnt++;
-
 	new_cnt = old_cnt + add_cnt + 1;
 	groups = devm_kcalloc(&rtc->dev, new_cnt, sizeof(*groups), GFP_KERNEL);
 	if (!groups)
-- 
2.47.2


