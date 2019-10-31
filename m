Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07BDAEAB29
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2019 08:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfJaH5E (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 31 Oct 2019 03:57:04 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:34788 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfJaH5E (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 31 Oct 2019 03:57:04 -0400
X-Greylist: delayed 1214 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Oct 2019 03:57:03 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=compulab.co.il; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uAoRMHcYZKy4HSzX2X5tNeqZPMGf2d0ZN2ceMih7kzc=; b=rENbBU4HftB4pVGJyVi9iC2Dxa
        Oyy0YtiEeTcoRNBYRwVvxSu7L8OChhyjwWhlLBNLI3xOHzfmgz+pPiIVt60/mGULl+2DBA+eh8CGT
        rD6cZdJJPzPQtZn4O744Eqz7Z9OxVepZ5Wy4Tw5nSwd5P5c04nns0j+UaGUeiFWXqQKZ/KzNXfMUt
        MnOtnll2D4UYOe4i5TZVYhxpaYEU7CFdy98uvD6HgXqMg2dIQR9Q+jFP4koHe8oIf+wSQ/u7hdYSc
        lWMwE3FdPMsQ4O7EgVytzsxX+6rxXwhOhEHD2OMpjylfrR8AD5PEyKzhmE72+Ji1jU31zE7FUB6BL
        3MWEZhew==;
Received: from [37.142.126.90] (port=39548 helo=zimbra-mta.compulab.co.il)
        by clab.compulab.co.il with esmtp (Exim 4.92)
        (envelope-from <ilya@ilya-pc.compulab.co.il>)
        id 1iQ50i-0003T4-Hk; Thu, 31 Oct 2019 03:36:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTP id E76DA481465;
        Thu, 31 Oct 2019 09:36:47 +0200 (IST)
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
        by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3QbQS-7Y4ZoD; Thu, 31 Oct 2019 09:36:47 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 5D8D3481468;
        Thu, 31 Oct 2019 09:36:47 +0200 (IST)
X-Virus-Scanned: amavisd-new at zimbra-mta.compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
        by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 6OOWzw6wVDoC; Thu, 31 Oct 2019 09:36:47 +0200 (IST)
Received: from ilya-pc (unknown [192.168.11.9])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTPS id 330B5481465;
        Thu, 31 Oct 2019 09:36:47 +0200 (IST)
Received: from ilya by ilya-pc with local (Exim 4.92)
        (envelope-from <ilya@ilya-pc>)
        id 1iQ50h-00053n-0C; Thu, 31 Oct 2019 09:36:47 +0200
From:   Ilya Ledvich <ilya@compulab.co.il>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Ilya Ledvich <ilya@compulab.co.il>
Subject: [PATCH] rtc: em3027: correct month value
Date:   Thu, 31 Oct 2019 09:36:43 +0200
Message-Id: <20191031073643.19410-1-ilya@compulab.co.il>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - clab.compulab.co.il
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ilya-pc.compulab.co.il
X-Get-Message-Sender-Via: clab.compulab.co.il: mailgid via get_recent_authed_mail_ips_entry: ilya@compulab.co.il/cached: full match of from_h in recent_authed_mail_ips_users
X-Authenticated-Sender: clab.compulab.co.il: ilya@compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC month value is 1-indexed, but the kernel assumes it is 0-indexed.
This may result in the RTC not rolling over correctly.

Signed-off-by: Ilya Ledvich <ilya@compulab.co.il>
---
 drivers/rtc/rtc-em3027.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
index 77cca1392253..ef3792543f93 100644
--- a/drivers/rtc/rtc-em3027.c
+++ b/drivers/rtc/rtc-em3027.c
@@ -71,7 +71,7 @@ static int em3027_get_time(struct device *dev, struct r=
tc_time *tm)
 	tm->tm_hour	=3D bcd2bin(buf[2]);
 	tm->tm_mday	=3D bcd2bin(buf[3]);
 	tm->tm_wday	=3D bcd2bin(buf[4]);
-	tm->tm_mon	=3D bcd2bin(buf[5]);
+	tm->tm_mon	=3D bcd2bin(buf[5]) - 1;
 	tm->tm_year	=3D bcd2bin(buf[6]) + 100;
=20
 	return 0;
@@ -94,7 +94,7 @@ static int em3027_set_time(struct device *dev, struct r=
tc_time *tm)
 	buf[3] =3D bin2bcd(tm->tm_hour);
 	buf[4] =3D bin2bcd(tm->tm_mday);
 	buf[5] =3D bin2bcd(tm->tm_wday);
-	buf[6] =3D bin2bcd(tm->tm_mon);
+	buf[6] =3D bin2bcd(tm->tm_mon) + 1;
 	buf[7] =3D bin2bcd(tm->tm_year % 100);
=20
 	/* write time/date registers */
--=20
2.20.1

