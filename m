Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FD329163F
	for <lists+linux-rtc@lfdr.de>; Sun, 18 Oct 2020 08:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgJRGUv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 18 Oct 2020 02:20:51 -0400
Received: from aliyun-cloud.icoremail.net ([47.90.73.12]:36712 "HELO
        aliyun-sdnproxy-4.icoremail.net" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with SMTP id S1725275AbgJRGUu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 18 Oct 2020 02:20:50 -0400
X-Greylist: delayed 710 seconds by postgrey-1.27 at vger.kernel.org; Sun, 18 Oct 2020 02:20:49 EDT
Received: by ajax-webmail-mail-app3 (Coremail) ; Sun, 18 Oct 2020 14:00:41
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date:   Sun, 18 Oct 2020 14:00:41 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc:     "Chen-Yu Tsai" <wens@csie.org>, "Kangjie Lu" <kjlu@umn.edu>,
        linux-rtc@vger.kernel.org,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Maxime Ripard" <mripard@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: Re: Re: [PATCH] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20201009205744.GA849573@piout.net>
References: <20200823075815.23457-1-dinghao.liu@zju.edu.cn>
 <CAGb2v640zTha1tzjOo3L+=T=N3hDRG+8qf2xu+bD8BMUnkhORQ@mail.gmail.com>
 <6de4a430.8e03.17429fa786d.Coremail.dinghao.liu@zju.edu.cn>
 <20201009205744.GA849573@piout.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6ea00d70.3f76.1753a4bb59b.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgB3GWgJ2otftqgZAA--.3185W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg4PBlZdtQccYQAEsF
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUblCS07vEb7Iv0x
        C_Ar1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
        07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
        6r4UMIAIbVCjxxvEw4WlV2xY6xkI7II2jI8vz4vEwIxGrwCS07vE42xK82IY6x8ErcxFaV
        Av8VW8uw4UJr1UMIAIbVCF72vE77IF4wCS07vE4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lV2xY
        6I8I3I0E5I8CrVAFwI0_Jr0_Jr4lV2xY6I8I3I0E7480Y4vE14v26r106r1rMIAIbVC2zV
        AF1VAY17CE14v26r1q6r43MIAIbVCI42IY6xIIjxv20xvE14v26r1j6r1xMIAIbVCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lV2xY6IIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s
        0DMIAIbVCI42IY6I8E87Iv67AKxVWUJVW8JwCS07vEIxAIcVC2z280aVCY1x0267AKxVWU
        JVW8JbIYCTnIWIevJa73U
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBPbiAyNi8wOC8yMDIwIDE2OjU1OjE0KzA4MDAsIGRpbmdoYW8ubGl1QHpqdS5lZHUuY24gd3Jv
dGU6Cj4gPiA+IE9uIFN1biwgQXVnIDIzLCAyMDIwIGF0IDM6NTkgUE0gRGluZ2hhbyBMaXUgPGRp
bmdoYW8ubGl1QHpqdS5lZHUuY24+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gV2hlbiBjbGtfaHdf
cmVnaXN0ZXJfZml4ZWRfcmF0ZV93aXRoX2FjY3VyYWN5KCkgZmFpbHMsCj4gPiA+ID4gY2xrX2Rh
dGEgc2hvdWxkIGJlIGZyZWVkLiBJdCdzIHRoZSBzYW1lIGZvciB0aGUgc3Vic2VxdWVudAo+ID4g
PiA+IGVycm9yIHBhdGhzLgo+ID4gPiAKPiA+ID4gSSBzdXBwb3NlIHlvdSBzaG91bGQgYWxzbyB1
bnJlZ2lzdGVyIHRoZSBhbHJlYWR5IHJlZ2lzdGVyZWQgY2xvY2tzCj4gPiA+IGluIHRoZSBsYXR0
ZXIgdHdvIGVycm9yIHBhdGhzPwo+ID4gPiAKPiA+IAo+ID4gU291bmRzIHJlYXNvbmFibGUuIEJ1
dCBJIGZpbmQgdGhhdCB0aGUgZXhpc3Rpbmcga2VybmVsIGNvZGUgdGFrZXMgZGlmZmVyZW50Cj4g
PiBzdHJhdGVnaWVzIGZvciB0aGlzIGNhc2UuIG9mX3NhbWE1ZDRfc2NrY19zZXR1cCgpIHVzZXMg
Y2xrX2h3X3VucmVnaXN0ZXIoKSAKPiA+IGFmdGVyIGNsa19od19yZWdpc3Rlcl9maXhlZF9yYXRl
X3dpdGhfYWNjdXJhY3koKSwgd2hpbGUgX29mX2ZpeGVkX2Nsa19zZXR1cCgpCj4gPiB1c2VzIGNs
a19od191bnJlZ2lzdGVyX2ZpeGVkX3JhdGUoKS4gQnV0IGF0OTFzYW05MjZ4X3BtY19zZXR1cCgp
IGp1c3QgZG9lcwo+ID4gbm90aGluZyBpbiB0aGlzIGNhc2UuCj4gCj4gSSBndWVzcyB5b3Ugc2hv
dWxkIHVzZSBjbGtfaHdfdW5yZWdpc3Rlcl9maXhlZF9yYXRlIGFmdGVyCj4gY2xrX2h3X3JlZ2lz
dGVyX2ZpeGVkX3JhdGVfd2l0aF9hY2N1cmFjeS4gY2xrX2h3X3VucmVnaXN0ZXIgd2lsbCBsZWFr
Cj4gdGhlIHN0cnVjdCBjbGtfZml4ZWRfcmF0ZS4gSXQgZG9lc24ndCBtYXR0ZXIgdG9vIG11Y2gg
Zm9yCj4gb2Zfc2FtYTVkNF9zY2tjX3NldHVwIGFuZCBhdDkxc2FtOTI2eF9wbWNfc2V0dXAgYmVj
YXVzZSBpZiB0aCBjbG9jawo+IGNhbid0IGJlIHJlZ2lzdGVyZWQsIHRoZSBwbGF0Zm9ybSB3aWxs
IG5vdCBib290LgoKVGhhbmsgeW91IGZvciB5b3VyIGFkdmljZSEgSSB3aWxsIHN1Ym1pdCBhIG5l
dyBwYXRjaCBzb29uLgoKUmVnYXJkcywKRGluZ2hhbwoK
