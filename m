Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8084A16F6E4
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2020 06:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgBZFNY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Feb 2020 00:13:24 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:55509 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726039AbgBZFNX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 Feb 2020 00:13:23 -0500
X-UUID: 8928d4acef9e406a97c878aa3c898b50-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nEHARF1NYyw5mdbN6rF7aICK/jenBfECNzSSvcS+Ztw=;
        b=eU5YNAOTRLWIoo4qBOCYQovlbUkbBzMA+IJUaXX90cv/wHNWsXQGYlra7HpJa9rAl1D2ty5pA4bFGWMrTwhBaepkANfaSNjzHrTkDNEPX8M90/ZqT0zlj65AvGLpOkc+qiTN2/YA+SKzfjXg1jtsV680YTWdNQNENnS1V69G6/U=;
X-UUID: 8928d4acef9e406a97c878aa3c898b50-20200226
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2127894363; Wed, 26 Feb 2020 13:13:17 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 13:11:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 13:13:23 +0800
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
Subject: [PATCH v3 0/4] Add Support for MediaTek MT2712 RTC
Date:   Wed, 26 Feb 2020 13:12:59 +0800
Message-ID: <20200226051303.22560-1-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VGhpcyBwYXRjaHNldCBhZGQgc3VwcG9ydCB0byBNVDI3MTIgUlRDLiBNVDI3MTIgUlRDIGlzIGEg
U29DIGJhc2VkIFJUQw0Kd2l0aCBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlIGNvbXBhcmVkIHRvIE1U
NzYyMiBSVEMuDQoNCkNoYW5nZXMgaW4gVjM6DQoxLiBjaGFuZ2Ugc3RydWN0IG10MjcxMl9ydGMN
CjIuIHVzZSAxMDAgYXMgeWVhciBvZmZzZXQNCjMuIGNoYW5nZSBpcnEgaGFuZGxlIHRocmVhZA0K
NC4gcmVtb3ZlIHVzZWxlc3MgcnRjIHRpbWUgY2hlY2sNCjUuIG5vdCBtb2RpZnkgc3RydWN0IHJ0
Y190aW1lIGluIHNldF90aW1lL3NldF9hbGFybSBmdW5jdGlvbnMNCjYuIG1vZGlmeSBydGMgaW5p
dCBmdW5jdGlvbg0KNy4gYWRkIHBvd2VyIGxvc3QgZmxhZyBmb3IgZ2V0X3RpbWUvc2V0X3RpbWUg
ZnVuY3Rpb25zDQo4LiBhZGQgLmFsYXJtX2lycV9lbmFibGUgY2FsbGJhY2sNCjkuIHNldCBydGMt
PnJhbmdlX21pbiBhbmQgcnRjLT5yYW5nZV9tYXggdG8gZG8gcmFuZ2UgY2hlY2tpbmcNCjEwLiB1
c2UgZml4ZWQgZHJpdmVyIG5hbWUNCg0KQ2hhbmdlcyBpbiBWMjoNCjEuIGNoYW5nZSBtaW5pbXVt
IHllYXIgZnJvbSAxOTY4IHRvIDIwMDANCjIuIGZpeCBsb2NrIHVzYWdlDQozLiBzdG9wIHRvIGNh
bGN1bGF0ZSB1c2VsZXNzIGRheSBvZiB3ZWVrDQo0LiBzdG9wIHRvIHNldCBkZWZhdWx0IGRhdGUg
YWZ0ZXIgaW5pdA0KNS4gY2hhbmdlIHRoZSBwcmVmaXggb2YgZnVuY3Rpb25zDQo2LiB1c2UgZGV2
bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgpIHRvIHJlcGxhY2UgcmVxdWVzdF90aHJlYWRlZF9pcnEo
KQ0KNy4gYWRkIG10MjcxMiBydGMgcmVsYXRlZCBmaWxlcyBpbnRvIE1BSU5UQUlORVJTDQoNClJh
biBCaSAoNCk6DQogIGJpbmRpbmdzOiBydGM6IGFkZCBiaW5kaW5ncyBmb3IgTVQyNzEyIFJUQw0K
ICBydGM6IGFkZCBzdXBwb3J0IGZvciB0aGUgTWVkaWFUZWsgTVQyNzEyIFJUQw0KICBhcm02NDog
ZHRzOiBhZGQgUlRDIG5vZGVzIGZvciBNVDI3MTINCiAgTUFJTlRBSU5FUlM6IGFkZCBNVDI3MTIg
UlRDIGZpbGVzDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvcnRjLW10MjcxMi50eHQg
ICAgfCAgMTQgKw0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMiArDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDI3MTJlLmR0c2kgICAg
IHwgICA2ICsNCiBkcml2ZXJzL3J0Yy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTAgKw0KIGRyaXZlcnMvcnRjL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMSArDQogZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jICAgICAgICAgICAgICAgICAgICAgIHwg
NDIyICsrKysrKysrKysrKysrKysrKw0KIDYgZmlsZXMgY2hhbmdlZCwgNDU1IGluc2VydGlvbnMo
KykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3J0Yy9ydGMtbXQyNzEyLnR4dA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3J0Yy9ydGMt
bXQyNzEyLmMNCg0KLS0gDQoyLjI1LjANCg==

