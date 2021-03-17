Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E98B33EB48
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Mar 2021 09:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCQIT4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Mar 2021 04:19:56 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11890 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhCQITs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Mar 2021 04:19:48 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210317081945euoutp0173d6dccf2456cbd844de57e168268a2c~tE2mgWIFY1212812128euoutp01y
        for <linux-rtc@vger.kernel.org>; Wed, 17 Mar 2021 08:19:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210317081945euoutp0173d6dccf2456cbd844de57e168268a2c~tE2mgWIFY1212812128euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1615969185;
        bh=hLfG1mLh/mmQm3ZtzhfOcgpbBnnOXvRKhCNQzWA7meA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nwLc/q3OM0PnROAP10E7jrli3uZrW8LP9J+9ul92w44umNQixXzFQo7rgLD4EvTr+
         Je14c9jAoAZfKNDjfubYecPDZCa1x+/CLjHqMvgNSPIrTRl+PvSZweQW9lNp1LHqOQ
         dPAGI3n2fszSSKWqrocxin9fHix8AEi05qf02WMg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210317081944eucas1p2a8414c40a85ebb288eb330aa6ef073a6~tE2lvgm4r0565005650eucas1p2w;
        Wed, 17 Mar 2021 08:19:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 29.56.09452.0ABB1506; Wed, 17
        Mar 2021 08:19:44 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210317081944eucas1p123bd27f3203c937d2969a66fb06d6d9e~tE2laXpAt3196031960eucas1p1r;
        Wed, 17 Mar 2021 08:19:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210317081944eusmtrp2cba4efe2928405d112d2361eeb95de27~tE2lZkuZn1423714237eusmtrp2h;
        Wed, 17 Mar 2021 08:19:44 +0000 (GMT)
X-AuditID: cbfec7f2-a9fff700000024ec-f1-6051bba0a4ef
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E3.B7.08696.0ABB1506; Wed, 17
        Mar 2021 08:19:44 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210317081944eusmtip2b2a2731d21436519728ef0f29878a5e1~tE2lOCMoe1399213992eusmtip2Z;
        Wed, 17 Mar 2021 08:19:44 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     alexandre.belloni@bootlin.com
Cc:     l.stelmach@samsung.com, a.zummo@towertech.it,
        b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, m.szyprowski@samsung.com
Subject: [PATCH 1/2] WIP: Introduce has_alarm method for rtc devices
Date:   Wed, 17 Mar 2021 09:19:35 +0100
Message-Id: <20210317081936.26583-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <dleftjblbjc6w1.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzned0FuwMTDL68MLBYcvEqu0X7u2Xs
        FhtnrGe1uHloBaPF5V1z2CyOrb7CZrH2yF12B3aPeWuqPfq2rGL0mD7vJ5PH501yASxRXDYp
        qTmZZalF+nYJXBmbztxmLJjBW/Gkq5e5gfEDVxcjJ4eEgInElK2PmbsYuTiEBFYwSjye3QTl
        fGGUOHf4CRuE85lRYlbnO1aYlm3TbjJBJJYzShy6Pp8RwnnOKHFvazsTSBWbgKNE/9ITYB0i
        AooSt/c9BJvLLLCQUeLBqnVgRcICLhKHD38Es1kEVCX+Ln/OAmLzClhLPH+/CWqdvET78u1s
        IDangIXEpwlvmSFqBCVOznwCVs8voCWxpuk6mM0MVN+8dTbYMgmBCxwSj36/YIIY5CLRdBbm
        B2GJV8e3sEPYMhL/d84HquEAsuslJk8yg+jtYZTYNucHC0SNtcSdc7/YQGqYBTQl1u/ShwgD
        PfnlKyNEK5/EjbeCECfwSUzaNp0ZIswr0dEmBFGtIrGufw/UQCmJ3lcrGCcwKs1C8swsJA/M
        Qti1gJF5FaN4amlxbnpqsWFearlecWJucWleul5yfu4mRmCCOf3v+KcdjHNffdQ7xMjEwXiI
        UYKDWUmE1zQvIEGINyWxsiq1KD++qDQntfgQozQHi5I476rZa+KFBNITS1KzU1MLUotgskwc
        nFINTHLPz+8Q3K3c0X3h7Ktk49wHnm3ymzP31/QvP6m1aauyVnXzezVtuc9nfqtetAmQfq79
        iunTFla+O6vyjx1cc3z34oun9mYWOIjcy50wZU/j1o+lHF5HN64+9M7zjLqIaqdCwuPo1duu
        mvqwsMw55xDzojx79VZGxn95V3ZzGl3oWajnVhcSM+vp0UtaE1kcdt95sc+n/6hjcVv5pk2W
        fLsUD7e/uOdRv3uKPvtztW8LLM+JpDRMFtsQfa3EXOvPwhemT1kvTLqb2g103Ude1qMzJBP2
        aXe1XYj9vfHy9b7Lx34s+CE36Z7ZSZP+N7ekfUM/hxbtElwuMmFr5uv6jJqSJQzVb+ZOjTu0
        8Ntc/xlKLMUZiYZazEXFiQDz39CinwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsVy+t/xe7oLdgcmGKx+Lmmx5OJVdov2d8vY
        LTbOWM9qcfPQCkaLy7vmsFkcW32FzWLtkbvsDuwe89ZUe/RtWcXoMX3eTyaPz5vkAlii9GyK
        8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DI2nbnNWDCD
        t+JJVy9zA+MHri5GTg4JAROJbdNuMoHYQgJLGSU+LPDoYuQAiktJrJybDlEiLPHnWhcbRMlT
        RolfZ/hBbDYBR4n+pSdYQWwRAUWJ2/seMncxcnEwCyxnlHj49QRYg7CAi8Thwx/B5rMIqEr8
        Xf6cBcTmFbCWeP5+EyvEAnmJ9uXbweo5BSwkPk14ywyxzFzixKtHTBD1ghInZz5hAbmNWUBd
        Yv08IZAwv4CWxJqm62AjmYHGNG+dzTyBUWgWko5ZCB2zkFQtYGRexSiSWlqcm55bbKRXnJhb
        XJqXrpecn7uJERhJ24793LKDceWrj3qHGJk4GA8xSnAwK4nwmuYFJAjxpiRWVqUW5ccXleak
        Fh9iNAX6bCKzlGhyPjCW80riDc0MTA1NzCwNTC3NjJXEeU2OrIkXEkhPLEnNTk0tSC2C6WPi
        4JRqYMqrea3NFybZ1tvwRmeyWNIJvXs8q45Om/OSWehn6aKFu69ei4h9uemPqp7we60PG+2C
        Te/+sH0+6e7tC3cDXGvvNB5PUxV2ym3b3O7Fs6Rz1SGd2x93KFRznl4jd1zmulsqn9A0bbVc
        hu6DrQuDf/dmutuuOdTd8DYru5Vz12vvsLnFU6u+3da/fU7511xD5YnhV7rs2Z//5Vrze1JE
        pYp/Qt97GTeZn9WbUtatamniPBzumZG+WXxDwLLjPI7hhmpFovJ1F/8a3njzd0v3rF2/7hz5
        VOWw5rez8Obpj2svTlEIML91TVzTYMGV/Cb+JtnXvi7Kky+2M7vs/6N7VLEqINc2qmtiaJyG
        sfKJDiWW4oxEQy3mouJEAFznvEYtAwAA
X-CMS-MailID: 20210317081944eucas1p123bd27f3203c937d2969a66fb06d6d9e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210317081944eucas1p123bd27f3203c937d2969a66fb06d6d9e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210317081944eucas1p123bd27f3203c937d2969a66fb06d6d9e
References: <dleftjblbjc6w1.fsf%l.stelmach@samsung.com>
        <CGME20210317081944eucas1p123bd27f3203c937d2969a66fb06d6d9e@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The method enables determining whether a device supports
setting alarms or not before checking if the alarm to be
set is in the past; thus, provides clear indication of
support for alarms in a given configuration.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
How about has_alarm() method. It can be checked at the beginning of
__rtc_set_alarm() like RTC_HAS_ALARM flag I proposed above, but doesn't
need to be introduced in all drivers at once.

See the following message for the implementation in the ds1307 driver.

The first uie_unsupported patch should be kept regardless of these two.

 drivers/rtc/interface.c | 6 ++++++
 include/linux/rtc.h     | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 794a4f036b99..1eb180370d9b 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -412,6 +412,12 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	time64_t now, scheduled;
 	int err;
 
+	if (!rtc->ops)
+		err = -ENODEV;
+	else if (rtc->ops->has_alarm &&
+		 !rtc->ops->has_alarm(rtc->dev.parent))
+		return -EINVAL;
+
 	err = rtc_valid_tm(&alarm->time);
 	if (err)
 		return err;
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 22d1575e4991..ce9fc77ccd02 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -66,6 +66,7 @@ struct rtc_class_ops {
 	int (*alarm_irq_enable)(struct device *, unsigned int enabled);
 	int (*read_offset)(struct device *, long *offset);
 	int (*set_offset)(struct device *, long offset);
+	int (*has_alarm)(struct device *);
 };
 
 struct rtc_device;
-- 
2.26.2
