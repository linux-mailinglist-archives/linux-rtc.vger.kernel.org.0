Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BF0293472
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Oct 2020 07:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391764AbgJTFy1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Oct 2020 01:54:27 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:54258 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391765AbgJTFy1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 20 Oct 2020 01:54:27 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Tue, 20 Oct 2020 13:53:59
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.148.79]
Date:   Tue, 20 Oct 2020 13:53:59 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Maxime Ripard" <maxime@cerno.tech>
Cc:     kjlu@umn.edu, "Alessandro Zummo" <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        "Chen-Yu Tsai" <wens@csie.org>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] [v2] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20201019080202.kgjoksz27dgyov7q@gilmour.lan>
References: <20201018072810.4249-1-dinghao.liu@zju.edu.cn>
 <20201019080202.kgjoksz27dgyov7q@gilmour.lan>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7821f744.b49c.17544924954.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgAHPxR3e45fLn05AA--.7567W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgATBlZdtQf4pwAAsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbGCS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r4rMIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
        xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
        FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
        AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
        0EY4v20xvaj40_WFyUJVCq3wCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBIaSwKPiAKPiBPbiBTdW4sIE9jdCAxOCwgMjAyMCBhdCAwMzoyODoxMFBNICswODAwLCBEaW5n
aGFvIExpdSB3cm90ZToKPiA+IFdoZW4gY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX3JhdGVfd2l0aF9h
Y2N1cmFjeSgpIGZhaWxzLAo+ID4gY2xrX2RhdGEgc2hvdWxkIGJlIGZyZWVkLiBJdCdzIHRoZSBz
YW1lIGZvciB0aGUgc3Vic2VxdWVudAo+ID4gdHdvIGVycm9yIHBhdGhzLCBidXQgd2Ugc2hvdWxk
IGFsc28gdW5yZWdpc3RlciB0aGUgYWxyZWFkeQo+ID4gcmVnaXN0ZXJlZCBjbG9ja3MgaW4gdGhl
bS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGluZ2hhbyBMaXUgPGRpbmdoYW8ubGl1QHpqdS5l
ZHUuY24+Cj4gPiAtLS0KPiA+IAo+ID4gQ2hhbmdlbG9nOgo+ID4gCj4gPiB2MjogLSBVbnJlZ2lz
dGVyIHRoZSBhbHJlYWR5IHJlZ2lzdGVyZWQgY2xvY2tzIG9uIGZhaWx1cmUuCj4gPiAtLS0KPiA+
ICBkcml2ZXJzL3J0Yy9ydGMtc3VuNmkuYyB8IDggKysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ydGMvcnRjLXN1bjZpLmMgYi9kcml2ZXJzL3J0Yy9ydGMtc3VuNmkuYwo+ID4gaW5k
ZXggZTJiOGIxNTBiY2I0Li42ZGUwZDNhZDczNmEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3J0
Yy9ydGMtc3VuNmkuYwo+ID4gKysrIGIvZHJpdmVycy9ydGMvcnRjLXN1bjZpLmMKPiA+IEBAIC0y
NzIsNyArMjcyLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHN1bjZpX3J0Y19jbGtfaW5pdChzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gPiAgCQkJCQkJCQkzMDAwMDAwMDApOwo+ID4gIAlpZiAo
SVNfRVJSKHJ0Yy0+aW50X29zYykpIHsKPiA+ICAJCXByX2NyaXQoIkNvdWxkbid0IHJlZ2lzdGVy
IHRoZSBpbnRlcm5hbCBvc2NpbGxhdG9yXG4iKTsKPiA+IC0JCXJldHVybjsKPiA+ICsJCWdvdG8g
ZXJyOwo+ID4gIAl9Cj4gPiAgCj4gPiAgCXBhcmVudHNbMF0gPSBjbGtfaHdfZ2V0X25hbWUocnRj
LT5pbnRfb3NjKTsKPiA+IEBAIC0yOTAsNyArMjkwLDggQEAgc3RhdGljIHZvaWQgX19pbml0IHN1
bjZpX3J0Y19jbGtfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gPiAgCXJ0Yy0+bG9z
YyA9IGNsa19yZWdpc3RlcihOVUxMLCAmcnRjLT5odyk7Cj4gPiAgCWlmIChJU19FUlIocnRjLT5s
b3NjKSkgewo+ID4gIAkJcHJfY3JpdCgiQ291bGRuJ3QgcmVnaXN0ZXIgdGhlIExPU0MgY2xvY2tc
biIpOwo+ID4gLQkJcmV0dXJuOwo+ID4gKwkJY2xrX2h3X3VucmVnaXN0ZXJfZml4ZWRfcmF0ZShy
dGMtPmludF9vc2MpOwo+ID4gKwkJZ290byBlcnI7Cj4gPiAgCX0KPiAKPiBUaGUgcG9pbnQgb2Yg
aGF2aW5nIGxhYmVscyBmb3IgdGhlIGVycm9yIHNlcXVlbmNlIGlzIHRvIGF2b2lkIHRvCj4gZHVw
bGljYXRlIHRoZSBlcnJvciBoYW5kbGluZyBjb2RlIGluIGVhY2ggYW5kIGV2ZXJ5IGVycm9yIGNv
ZGUgcGF0aC4KPiAKPiBZb3Ugc2hvdWxkIGFkZCBhbm90aGVyIGxhYmVsIGZvciB0aGUgZml4ZWQg
cmF0ZSBjbG9jayB1bnJlZ2lzdHJhdGlvbgo+IAoKRmluZSwgSSB3aWxsIGZpeCB0aGlzIHNvb24u
CgpSZWdhcmRzLApEaW5naGFvCg==
