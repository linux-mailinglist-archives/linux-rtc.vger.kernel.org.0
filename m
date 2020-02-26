Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8E816F6E3
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2020 06:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgBZFN1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Feb 2020 00:13:27 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:38629 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725789AbgBZFN0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 Feb 2020 00:13:26 -0500
X-UUID: 17a0de6a06b94282982f67e28045ae21-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uxsCDf0ysT4LH+OE1Me7ZG/35nON8l37J7ezy9Y74SI=;
        b=gObAcAyG3J4tHMgLjassxoo3e140klbC5tOipZZmrI/Hc22RjkvTjD2/kQlVknok0TtAMxw9nV8X7ZWRzWYxpphtoSe+9IDvxZ+s2Jtztf9nsI56fliWyYENuJoJac1z5FUK0qa3VZ+2Dh1KIJsPREVNeNZiaBwblh5re7z+tNQ=;
X-UUID: 17a0de6a06b94282982f67e28045ae21-20200226
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1616975535; Wed, 26 Feb 2020 13:13:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 13:14:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 13:13:27 +0800
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH v3 3/4] arm64: dts: add RTC nodes for MT2712
Date:   Wed, 26 Feb 2020 13:13:02 +0800
Message-ID: <20200226051303.22560-4-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200226051303.22560-1-ran.bi@mediatek.com>
References: <20200226051303.22560-1-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VGhpcyBwYXRjaCBhZGQgZGV2aWNlIG5vZGUgZm9yIE1UMjcxMiBSVEMuDQoNClNpZ25lZC1vZmYt
Ynk6IFJhbiBCaSA8cmFuLmJpQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpIHwgNiArKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210MjcxMmUuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNp
DQppbmRleCA0MzMwN2JhZDNmMGQuLjMxMTY2YzE3YzM5YSAxMDA2NDQNCi0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210MjcxMmUuZHRzaQ0KQEAgLTMwMyw2ICszMDMsMTIgQEAgdWFydDU6IHNl
cmlhbEAxMDAwZjAwMCB7DQogCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KIAl9Ow0KIA0KKwlydGM6
IHJ0Y0AxMDAxMTAwMCB7DQorCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1ydGMiOw0K
KwkJcmVnID0gPDAgMHgxMDAxMTAwMCAwIDB4MTAwMD47DQorCQlpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMjM5IElSUV9UWVBFX0xFVkVMX0xPVz47DQorCX07DQorDQogCXNwaXMxOiBzcGlAMTAwMTMw
MDAgew0KIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItc3BpLXNsYXZlIjsNCiAJCXJl
ZyA9IDwwIDB4MTAwMTMwMDAgMCAweDEwMD47DQotLSANCjIuMjUuMA0K

