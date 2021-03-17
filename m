Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6AD33EB49
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Mar 2021 09:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhCQIT4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Mar 2021 04:19:56 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:25198 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhCQITu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Mar 2021 04:19:50 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210317081948euoutp023e93f44bb8c06bb3e666b6f8f60d4aa7~tE2phqS6n0527705277euoutp02k
        for <linux-rtc@vger.kernel.org>; Wed, 17 Mar 2021 08:19:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210317081948euoutp023e93f44bb8c06bb3e666b6f8f60d4aa7~tE2phqS6n0527705277euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1615969188;
        bh=G4CEsHOeaP5pcztqVl2L6dMz4bHf39tKQXQToxGQVGc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mDIdOoyQ2hGsLqfSlJhEOEAH0JG+cT+fis+aXel2Id2ib+C4FPCgRRf57YPALKTwp
         QjIEUnXmzuiUV7sG/gIK1+qYYeij1p2e88flKEXNzrH11O2AVxGBXJGEBZ1OoCPX1h
         0CY3+3mzz0tTpNdUWrnBfpf5dwoMWkHdsBlA9N5U=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210317081948eucas1p2667d018a543623129ded9d61e9147376~tE2pEELNY1615916159eucas1p2D;
        Wed, 17 Mar 2021 08:19:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CB.56.09452.4ABB1506; Wed, 17
        Mar 2021 08:19:48 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210317081947eucas1p15a31b346977fba94bf154716c3d89cb0~tE2oplhr51281712817eucas1p16;
        Wed, 17 Mar 2021 08:19:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210317081947eusmtrp102c4cd63ae4c762407fc779cb32e0655~tE2oo5zcr2416624166eusmtrp1f;
        Wed, 17 Mar 2021 08:19:47 +0000 (GMT)
X-AuditID: cbfec7f2-a9fff700000024ec-fd-6051bba4f72d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 25.B7.08705.3ABB1506; Wed, 17
        Mar 2021 08:19:47 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210317081947eusmtip1c130131e95b52183d1dea83961747a32~tE2ocnME11518915189eusmtip1f;
        Wed, 17 Mar 2021 08:19:47 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     alexandre.belloni@bootlin.com
Cc:     l.stelmach@samsung.com, a.zummo@towertech.it,
        b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, m.szyprowski@samsung.com
Subject: [PATCH 2/2] WIP: Provide has_alarm method
Date:   Wed, 17 Mar 2021 09:19:36 +0100
Message-Id: <20210317081936.26583-2-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317081936.26583-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduznOd0luwMTDP5OFLVYcvEqu0X7u2Xs
        FhtnrGe1uHloBaPF5V1z2CyOrb7CZrH2yF12B3aPeWuqPfq2rGL0mD7vJ5PH501yASxRXDYp
        qTmZZalF+nYJXBlt/5+wFnxnr7g7YRprA+Nlti5GDg4JAROJpl25XYycHEICKxglVhwK7mLk
        ArK/MEr0Pb7DBuF8ZpRY/rmbBaQKpGHr/ztMEInljBKTlh5ghnCeM0o83LkCrIpNwFGif+kJ
        VhBbREBR4va+h2BFzAILGSUerFrHBJIQFjCSOLZmFzOIzSKgKvHqUBs7iM0rYC3x595ERoh1
        8hLty7ezgdicAjYSB5csZ4SoEZQ4OfMJ2DJ+AS2JNU3XwWxmoPrmrbPBlkkI3OCQuDp7HRvE
        IBeJNU/uMUPYwhKvjm9hh7BlJE5P7mGBBEa9xORJZhC9PYwS2+b8gPrZWuLOuV/gAGMW0JRY
        v0sfIuwo0XZmGStEK5/EjbeCECfwSUzaNp0ZIswr0dEmBFGtIrGufw/UQCmJ3lcrGCcwKs1C
        8swsJA/MQti1gJF5FaN4amlxbnpqsWFearlecWJucWleul5yfu4mRmByOf3v+KcdjHNffdQ7
        xMjEwXiIUYKDWUmE1zQvIEGINyWxsiq1KD++qDQntfgQozQHi5I476rZa+KFBNITS1KzU1ML
        UotgskwcnFINTG5fLQuEH089ckI8M2d3Z6p6YpBGWX2tBfeFtveXn18x3x4799w6zn18PhuZ
        v3Xoff/mbdNxam3XqapjmXf8VzI+erfA3sH3bYJD/uFOngvbGBTrZglLXLS52naFvbNxxxvV
        Ds37xb0SIfFtPFa6nWolX++utW3RXfWPn3NeQkquS9a6+tk+vd8zz5xcYTMlze9sePi8rEWS
        k2U4ogxVhH9fWR71VH49/zIXmQPO0y2f3Fv5rS5Llqc8wUUg/CgH742CTNfLKX0KLrlRBlOZ
        Svvnyp8/tP1njOyCU2cdOlYuU9jxPtv9Gc+BYwYXTbYV376WlfBna9bL61KbBadmGLRkbzA1
        OhtYPje/gtdWiaU4I9FQi7moOBEAUROHiZ0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsVy+t/xu7qLdwcmGFxeaGax5OJVdov2d8vY
        LTbOWM9qcfPQCkaLy7vmsFkcW32FzWLtkbvsDuwe89ZUe/RtWcXoMX3eTyaPz5vkAlii9GyK
        8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DLa/j9hLfjO
        XnF3wjTWBsbLbF2MnBwSAiYSW//fYepi5OIQEljKKHGj9SRQggMoISWxcm46RI2wxJ9rXWwQ
        NU8ZJZqan4I1swk4SvQvPcEKYosIKErc3veQGaSIWWA5o8TDryfAioQFjCSOrdnFDGKzCKhK
        vDrUxg5i8wpYS/y5N5ERYoO8RPvy7WD1nAI2EgeXLAeLCwlkSmz69o8Zol5Q4uTMJywgxzEL
        qEusnycEEuYX0JJY03SdBcRmBhrTvHU28wRGoVlIOmYhdMxCUrWAkXkVo0hqaXFuem6xoV5x
        Ym5xaV66XnJ+7iZGYDRtO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMJrmheQIMSbklhZlVqUH19U
        mpNafIjRFOizicxSosn5wHjOK4k3NDMwNTQxszQwtTQzVhLn3Tp3TbyQQHpiSWp2ampBahFM
        HxMHp1QD09Hd8z/+eDz9x8UQBQnefz2nfb1qyp5fPff8uJo3w7IjIZtuK5w7Ys+V25YqKbT0
        U8IN7aooloc8u6RvvWxftfFE8ZYvi7V2uthVGgS8+ecSqqXzW063daX8GxP9/TOZjd5f1eAU
        td228ZTVIu2Wb/zKq74L6RgZGV7/cvP1/9RdJ9ZKaUyqqp52L9vj2JqDc7Ztn8PhX3PUcb/q
        c/OCU+an1sguCpNf8u/m2nT5WS/efLQuq2gsPZ40aadYzXOVCbLpvan3P2xTN9E2ONMf1/hs
        4o5tJQmPBX6+ONenmH7t3DJGf+17ETPyX38z1y9q5UmYoRx68wdTasP0c9pG5hypr9zcXvP4
        PT/I7lHG9l2JpTgj0VCLuag4EQBNaBetLwMAAA==
X-CMS-MailID: 20210317081947eucas1p15a31b346977fba94bf154716c3d89cb0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210317081947eucas1p15a31b346977fba94bf154716c3d89cb0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210317081947eucas1p15a31b346977fba94bf154716c3d89cb0
References: <dleftjblbjc6w1.fsf%l.stelmach@samsung.com>
        <20210317081936.26583-1-l.stelmach@samsung.com>
        <CGME20210317081947eucas1p15a31b346977fba94bf154716c3d89cb0@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 drivers/rtc/rtc-ds1307.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index b21e06583bd5..dee60f459a3e 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -387,6 +387,13 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 	return 0;
 }
 
+static int ds1307_has_alarm(struct device *dev)
+{
+	struct ds1307 *ds1307 = dev_get_drvdata(dev);
+
+	return test_bit(HAS_ALARM, &ds1307->flags);
+}
+
 static int ds1337_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct ds1307		*ds1307 = dev_get_drvdata(dev);
@@ -1201,6 +1208,7 @@ static const struct rtc_class_ops ds13xx_rtc_ops = {
 	.read_alarm	= ds1337_read_alarm,
 	.set_alarm	= ds1337_set_alarm,
 	.alarm_irq_enable = ds1307_alarm_irq_enable,
+	.has_alarm	= ds1307_has_alarm,
 };
 
 static ssize_t frequency_test_store(struct device *dev,
-- 
2.26.2

