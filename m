Return-Path: <linux-rtc+bounces-6092-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE5ZOSdopGlcfgUAu9opvQ
	(envelope-from <linux-rtc+bounces-6092-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Mar 2026 17:24:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 580D31D09D5
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Mar 2026 17:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46FD230053F6
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Mar 2026 16:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C0C30E84A;
	Sun,  1 Mar 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QVqVJ8V/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B118FDDE;
	Sun,  1 Mar 2026 16:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772382214; cv=none; b=olbdGONjx73kelBF3hpdQZqqdW1tF8RqBXtwkG2NIM5y3+U0I00eTusb0kALfKzPu7a5N+IMerpUlXTjzP9ytbpDWAtwUWW4tjgK8UrquisIqowO08F/YDYeqRh4yQYHl6upw7T60Vwk18KtehHBz5EKFcz6LS76BfffQ+xbcMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772382214; c=relaxed/simple;
	bh=23CM7Md0r37lUyPaT6ciitb1CPWDJTZbY5ZR8DicXsU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=nwrq7A5Zop36WdQIbn/LyE7xpe6SA9L4NgtaDBbijI0Lt530ilz6FNCWWuUUh9jnWZ3NbIG5g0XMXplBrSEllz3O16slUpLakuqKWn/69F5kMwUdoM2Y1rPkFbtFHvGefBJDSh8oBDz7nJrBVTdQlCxCi/zBptj8OC9zkWwiZmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QVqVJ8V/; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772382202; bh=6IASky7UeKNH6RIK3b7iRvf98oSz9nCNTLWsKND45F0=;
	h=From:To:Cc:Subject:Date;
	b=QVqVJ8V/YKhmGRt+bsV6vsG3xkVsqibNJpJofDFelTYxS/KjpUoR+6gLxDawtoQez
	 RtwTi2HEZZA9WlEBPHncbg6N7CiZCnDXGT8C7VSadh36MWvLdy3ZkUIPzHDsIUTQIT
	 /uW5IBYF0cRqrPbYDzuyb3tUKYPCRg/+WuffuUFI=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 4FB8446E; Mon, 02 Mar 2026 00:19:59 +0800
X-QQ-mid: xmsmtpt1772381999tgw5e8ybi
Message-ID: <tencent_6BA6C87DB3B5EE61C7A22CADE9F5DBBCC90A@qq.com>
X-QQ-XMAILINFO: OOECh7dB9AaU8WUjbWtinmWDb1sg4ld36mklb9QBa0XQchoSvgkBgNTQ6Ud4wY
	 q2v6ccOz5ochNVWuGoVjo1vwYk6BtgaVsOscMAYuJmNmDglQlz/+3Gacu9YLx/Jthe+4tonybYFB
	 +CPBtpRj42B+XTFUf/+iWoaJyCO7Txf9WAItWYNX1sZjBM4RKzmRSqsJpsvH50CsNh+KUfZKZFt7
	 f29MM4mkHC6NEZ39zPTEIAKW68PTN8kVOyxCGywys9bUG27NfA4QaneoYzVq28FeKf0Yy2GFEXp2
	 vli4SCGGf2ho0J4a7tmp+OOx54xR979POX3Kj+6dE29YGUiIwqTyZSFD+XJ46aoIPqJCJbJRQoWQ
	 crxmkYnz+yq2nSTzPDE+pdv23+W2psdkINv4dXHD8pZVD0MYout699jGLBlVkcWJ3nLCIQmSp0cw
	 vym29FyPa8q+g6O6kwox7aQamy+/VSpptf9OoRqIM8PUHABFFt9EzFVwK6qDa/GSxy+JQWK9dQWc
	 eFRYWng1Yq8ViUTvDmd5nCAJbrpNlchZBNJUJ78Fw8m/oMQHB2byPI0MJmTgxI9s1MOdGhxoD94G
	 U+HlRJzznj9Ff3Gg2gXn7LOMqnnJJC4IadeG1/lhVJQGtTnPrq9z+Ysh+1wjKIKwBasdeXQ4z/BC
	 J9XwJ3ZROVo0GfYJOAQvcba3469c91VZ7268VuI05SxYCKlYGCQjmAOHWhS+Qe6bcV2XPjIdj9yg
	 QIo5s2HQn1cDRhI6oUJ8jew6pclksKiJ9yVddg8c5L5YsUZ17oy2tjOuqXEAYStDn7T913TKst+v
	 bmO5p1Q4UHUw+HDXQBjeXKirZS7Qb9gDdOgb3eac+Y2fJsPRMQtCK+uVtkXHn3VeLhB/XM4d5qur
	 hZa7WTFl6ljyGTiHI+zFpXIsytB1OaufozVQaJhU2RyrQTIhM5GuXIddaljvoZ2weLBHAB+ZRGx3
	 2zxhuTstTe5ODBSL4rYYTIUcKgBy4UnV+6kCnLzj0WY4k/kTkcgS09t4t/CzluFGI9no7SPOyFl6
	 eeLh+z3IHySoE53P+rGtHpJFH04KRqnCkq9/EvPTXRWqTl5RmvN1+1oa0hsUcixJuUXIVmxIT5/3
	 VM0FR0rmKb36g0670=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Zhaoyang Yu <2426767509@qq.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] rtc: spear: check return value of clk_enable in resume
Date: Sun,  1 Mar 2026 16:19:58 +0000
X-OQ-MSGID: <20260301161958.266447-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6092-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,qq.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 580D31D09D5
X-Rspamd-Action: no action

In spear_rtc_resume(), the return value of clk_enable() is currently
ignored. If clk_enable() fails, the driver proceeds to call
spear_rtc_enable_interrupt().

The spear_rtc_enable_interrupt() function performs a readl() on the
RTC control register (CTRL_REG) as its first operation. Accessing an
MMIO register of a peripheral without an enabled functional clock is
unsafe on SPEAr architectures and can lead to a system hang or data
abort.

Fix this by checking the return value of clk_enable(). If it fails,
print an error message and return the error code to avoid the unsafe
register access.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
 drivers/rtc/rtc-spear.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
index 959acff8faff..9bf7cf264715 100644
--- a/drivers/rtc/rtc-spear.c
+++ b/drivers/rtc/rtc-spear.c
@@ -437,7 +437,7 @@ static int spear_rtc_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct spear_rtc_config *config = platform_get_drvdata(pdev);
-	int irq;
+	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
 
@@ -447,7 +447,11 @@ static int spear_rtc_resume(struct device *dev)
 			config->irq_wake = 0;
 		}
 	} else {
-		clk_enable(config->clk);
+		ret = clk_enable(config->clk);
+		if (ret) {
+			dev_err(dev, "Unable to enable clock on resume: %d\n", ret);
+			return ret;
+		}
 		spear_rtc_enable_interrupt(config);
 	}
 
-- 
2.34.1


