Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 563ADEC0E0
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2019 10:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbfKAJyd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 1 Nov 2019 05:54:33 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:56494 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfKAJyd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 1 Nov 2019 05:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=compulab.co.il; s=default; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9kc02o6DBkw7WKmuUgNwX2/uu/pyzK310NO2fVCeBR4=; b=nRr/WdgEojTJwulhaWo0OLS6rV
        4nswpUG+tfgmRBMCeBvugL24O7dPuZCfH5OutRTS2lKZrjFJ8id8/dPxObIL+rLdh4JO85uJt+kD0
        ayKCiHbv6r676vNqeFkVfNno1Ha21nJxzISQ2KqLegTU9vsLzx6x+HHG5VPAeILQb7zRS81HBHiZZ
        qk/pfD4sEpDYF0X7CPvQwNeNjsy7ZQafp2eRWTx023wgywIDjTTK+sTP28f3cA9z7eNrDs8qx9Sft
        AzVX1JCJz8YBUDeYXqRP9FEDc9rFBUhL4s437R36SudYv48hPdB65275JZJw3MzATbhxdtffiesyp
        V95QCimw==;
Received: from [37.142.126.90] (port=43097 helo=zimbra-mta.compulab.co.il)
        by clab.compulab.co.il with esmtp (Exim 4.92)
        (envelope-from <ilya@ilya-pc.compulab.co.il>)
        id 1iQTdW-0001lo-RO; Fri, 01 Nov 2019 05:54:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 387F14814FB;
        Fri,  1 Nov 2019 11:54:30 +0200 (IST)
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
        by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id yqQ-tYYD4TK1; Fri,  1 Nov 2019 11:54:29 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTP id B546F4814FD;
        Fri,  1 Nov 2019 11:54:29 +0200 (IST)
X-Virus-Scanned: amavisd-new at zimbra-mta.compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
        by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id sL0GNRONggWl; Fri,  1 Nov 2019 11:54:29 +0200 (IST)
Received: from ilya-pc (unknown [192.168.11.9])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTPS id 8F2614814FB;
        Fri,  1 Nov 2019 11:54:29 +0200 (IST)
Received: from ilya by ilya-pc with local (Exim 4.92)
        (envelope-from <ilya@ilya-pc>)
        id 1iQTdV-0003rE-HO; Fri, 01 Nov 2019 11:54:29 +0200
From:   Ilya Ledvich <ilya@compulab.co.il>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-rtc@vger.kernel.org, Ilya Ledvich <ilya@compulab.co.il>
Subject: [PATCH v2] rtc: em3027: correct month value
Date:   Fri,  1 Nov 2019 11:54:22 +0200
Message-Id: <20191101095422.14787-1-ilya@compulab.co.il>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031102717.GB2967@piout.net>
References: <20191031102717.GB2967@piout.net>
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
index 77cca1392253..9f176bce48ba 100644
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
+	buf[6] =3D bin2bcd(tm->tm_mon + 1);
 	buf[7] =3D bin2bcd(tm->tm_year % 100);
=20
 	/* write time/date registers */
--=20
2.20.1

