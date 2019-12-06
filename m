Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 638E4115122
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2019 14:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfLFNio (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Dec 2019 08:38:44 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:60710 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726325AbfLFNin (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Dec 2019 08:38:43 -0500
X-UUID: 03a3e438f7394e7bbdaf1637691b62be-20191206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=20DdYNmRn+XgG0rR7STf/vH2MSHtbMKg/TCTvePLOKg=;
        b=JBJ4YSm19x4Bz43nMUM8kjlUetFYz6ekpo57rk+MhIWimTtT9zflwPoJjkuq2dMqvDvwBwZOB2CXxfMWOm4CW/LUBecW6A1T9yp3XiS3T4db/psAwHV+OA9+x7FTicohWQC8SZRpQdGCewy7pF0akNNPIlanHwBreBDNl7CrZLM=;
X-UUID: 03a3e438f7394e7bbdaf1637691b62be-20191206
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1431212983; Fri, 06 Dec 2019 21:38:39 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 21:38:25 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 21:38:00 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v6 6/6] rtc: Add support for the MediaTek MT6358 RTC
Date:   Fri, 6 Dec 2019 21:33:03 +0800
Message-ID: <1575639183-17606-7-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1575639183-17606-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1575639183-17606-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RnJvbTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPg0KDQpUaGlzIGFkZCBzdXBwb3J0IGZv
ciB0aGUgTWVkaWFUZWsgTVQ2MzU4IFJUQy4gRHJpdmVyIHVzaW5nDQpjb21wYXRpYmxlIGRhdGEg
dG8gc3RvcmUgZGlmZmVyZW50IFJUQ19XUlRHUiBhZGRyZXNzIG9mZnNldC4NCg0KU2lnbmVkLW9m
Zi1ieTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTogSHNpbi1I
c2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJz
L3J0Yy9ydGMtbXQ2Mzk3LmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jIGIvZHJpdmVycy9ydGMvcnRj
LW10NjM5Ny5jDQppbmRleCBiMjE2YmRjLi42MzFlMjc1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9y
dGMvcnRjLW10NjM5Ny5jDQorKysgYi9kcml2ZXJzL3J0Yy9ydGMtbXQ2Mzk3LmMNCkBAIC0xMiw2
ICsxMiw3IEBADQogI2luY2x1ZGUgPGxpbnV4L2lycWRvbWFpbi5oPg0KICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KKyNp
bmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+DQog
I2luY2x1ZGUgPGxpbnV4L2lvLmg+DQogI2luY2x1ZGUgPGxpbnV4L21mZC9tdDYzOTcvY29yZS5o
Pg0KQEAgLTE5LDcgKzIwLDggQEANCiAjZGVmaW5lIFJUQ19CQlBVCQkweDAwMDANCiAjZGVmaW5l
IFJUQ19CQlBVX0NCVVNZCQlCSVQoNikNCiANCi0jZGVmaW5lIFJUQ19XUlRHUgkJMHgwMDNjDQor
I2RlZmluZSBSVENfV1JUR1JfTVQ2MzU4CTB4M2ENCisjZGVmaW5lIFJUQ19XUlRHUl9NVDYzOTcJ
MHgzYw0KIA0KICNkZWZpbmUgUlRDX0lSUV9TVEEJCTB4MDAwMg0KICNkZWZpbmUgUlRDX0lSUV9T
VEFfQUwJCUJJVCgwKQ0KQEAgLTYzLDYgKzY1LDEwIEBADQogI2RlZmluZSBSVENfTlVNX1lFQVJT
CQkxMjgNCiAjZGVmaW5lIFJUQ19NSU5fWUVBUl9PRkZTRVQJKFJUQ19NSU5fWUVBUiAtIFJUQ19C
QVNFX1lFQVIpDQogDQorc3RydWN0IG10a19ydGNfZGF0YSB7DQorCXUzMgkJCXdydGdyOw0KK307
DQorDQogc3RydWN0IG10NjM5N19ydGMgew0KIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2Ow0KIAlzdHJ1
Y3QgcnRjX2RldmljZQkqcnRjX2RldjsNCkBAIC03MCwxNSArNzYsMzQgQEAgc3RydWN0IG10NjM5
N19ydGMgew0KIAlzdHJ1Y3QgcmVnbWFwCQkqcmVnbWFwOw0KIAlpbnQJCQlpcnE7DQogCXUzMgkJ
CWFkZHJfYmFzZTsNCisJY29uc3Qgc3RydWN0IG10a19ydGNfZGF0YSAqZGF0YTsNCit9Ow0KKw0K
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3J0Y19kYXRhIG10NjM1OF9ydGNfZGF0YSA9IHsNCisJ
LndydGdyID0gUlRDX1dSVEdSX01UNjM1OCwNCiB9Ow0KIA0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX3J0Y19kYXRhIG10NjM5N19ydGNfZGF0YSA9IHsNCisJLndydGdyID0gUlRDX1dSVEdSX01U
NjM5NywNCit9Ow0KKw0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10NjM5N19y
dGNfb2ZfbWF0Y2hbXSA9IHsNCisJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzNTgtcnRj
IiwNCisJCS5kYXRhID0gKHZvaWQgKikmbXQ2MzU4X3J0Y19kYXRhLCB9LA0KKwl7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10NjM5Ny1ydGMiLA0KKwkJLmRhdGEgPSAodm9pZCAqKSZtdDYzOTdf
cnRjX2RhdGEsIH0sDQorCXt9DQorfTsNCitNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdDYzOTdf
cnRjX29mX21hdGNoKTsNCisNCiBzdGF0aWMgaW50IG10a19ydGNfd3JpdGVfdHJpZ2dlcihzdHJ1
Y3QgbXQ2Mzk3X3J0YyAqcnRjKQ0KIHsNCiAJdW5zaWduZWQgbG9uZyB0aW1lb3V0ID0gamlmZmll
cyArIEhaOw0KIAlpbnQgcmV0Ow0KIAl1MzIgZGF0YTsNCiANCi0JcmV0ID0gcmVnbWFwX3dyaXRl
KHJ0Yy0+cmVnbWFwLCBydGMtPmFkZHJfYmFzZSArIFJUQ19XUlRHUiwgMSk7DQorCXJldCA9IHJl
Z21hcF93cml0ZShydGMtPnJlZ21hcCwNCisJCQkgICBydGMtPmFkZHJfYmFzZSArIHJ0Yy0+ZGF0
YS0+d3J0Z3IsIDEpOw0KIAlpZiAocmV0IDwgMCkNCiAJCXJldHVybiByZXQ7DQogDQpAQCAtMzMz
LDYgKzM1OCw5IEBAIHN0YXRpYyBpbnQgbXRrX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KIAlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJD
RV9NRU0sIDApOw0KIAlydGMtPmFkZHJfYmFzZSA9IHJlcy0+c3RhcnQ7DQogDQorCXJ0Yy0+ZGF0
YSA9IChzdHJ1Y3QgbXRrX3J0Y19kYXRhICopDQorCQkJb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
KCZwZGV2LT5kZXYpOw0KKw0KIAlydGMtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7
DQogCWlmIChydGMtPmlycSA8IDApDQogCQlyZXR1cm4gcnRjLT5pcnE7DQpAQCAtNDA2LDEyICs0
MzQsNiBAQCBzdGF0aWMgaW50IG10NjM5N19ydGNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikN
CiBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobXQ2Mzk3X3BtX29wcywgbXQ2Mzk3X3J0Y19zdXNw
ZW5kLA0KIAkJCW10NjM5N19ydGNfcmVzdW1lKTsNCiANCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBtdDYzOTdfcnRjX29mX21hdGNoW10gPSB7DQotCXsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ2Mzk3LXJ0YyIsIH0sDQotCXsgfQ0KLX07DQotTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgbXQ2Mzk3X3J0Y19vZl9tYXRjaCk7DQotDQogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgbXRrX3J0Y19kcml2ZXIgPSB7DQogCS5kcml2ZXIgPSB7DQogCQkubmFtZSA9ICJtdDYz
OTctcnRjIiwNCi0tIA0KMi42LjQNCg==

