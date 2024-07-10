Return-Path: <linux-rtc+bounces-1461-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0EA92CA5D
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 08:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15FB81F234E2
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 06:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBEB50A80;
	Wed, 10 Jul 2024 06:08:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D24AA47;
	Wed, 10 Jul 2024 06:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720591683; cv=none; b=jWH88eEbVoQY5cCCed5wGSlqWNjOZP6cnMKciaRSR5C/VHzRx895udezIqukWDssLxFEIul2yRjseWEY/w0oX7GexTWJUqTR4sKV4cRr5AnNbOxoaAKJU4RcdYhASvkdXlfvzdR5ZdkE0c750bue5k3rTJOwCsOFALLGisOrfFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720591683; c=relaxed/simple;
	bh=Vqi1oGiBXxepwl9p1EPXwB1zZlBsC5MWt9td9m+PE3A=;
	h=From:To:Cc:Subject:Date:Message-Id; b=U0DSsLKKbQyzorNeP43KTSIWNlVyog3vEdygp66gld8AN3rgCXlqOg5FT1e9s1fezLzOLam0FIU57Qjv5lU1zwrrOx+klyfroAFi+5AYCuzJ2wOW0Io/MkyNKnUoSWesagL9shkWA63TGg8VFC0LR23vpO+u+SwjurkxDeRu+QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee7668e2532cbc-29cbd;
	Wed, 10 Jul 2024 14:07:47 +0800 (CST)
X-RM-TRANSID:2ee7668e2532cbc-29cbd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.54.5.255])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9668e2530a67-dc3f9;
	Wed, 10 Jul 2024 14:07:46 +0800 (CST)
X-RM-TRANSID:2ee9668e2530a67-dc3f9
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: alexandre.belloni@bootlin.com,
	shuah@kernel.org
Cc: linux-rtc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] selftests/rtc:Fix a resource leak
Date: Tue,  9 Jul 2024 23:07:43 -0700
Message-Id: <20240710060743.4691-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The opened file should be closed before exit, otherwise resource leak
will occur that this problem was discovered by reading code

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/testing/selftests/rtc/setdate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/rtc/setdate.c b/tools/testing/selftests/rtc/setdate.c
index b303890b3de2..17a00affb0ec 100644
--- a/tools/testing/selftests/rtc/setdate.c
+++ b/tools/testing/selftests/rtc/setdate.c
@@ -65,6 +65,7 @@ int main(int argc, char **argv)
 	retval = ioctl(fd, RTC_RD_TIME, &current);
 	if (retval == -1) {
 		perror("RTC_RD_TIME ioctl");
+		close(fd);
 		exit(errno);
 	}
 
-- 
2.17.1




