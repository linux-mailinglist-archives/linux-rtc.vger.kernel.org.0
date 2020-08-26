Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE2225298C
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Aug 2020 10:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgHZIzn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Aug 2020 04:55:43 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:34038 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727793AbgHZIzn (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 26 Aug 2020 04:55:43 -0400
Received: by ajax-webmail-mail-app2 (Coremail) ; Wed, 26 Aug 2020 16:55:14
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.144.184]
Date:   Wed, 26 Aug 2020 16:55:14 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Chen-Yu Tsai" <wens@csie.org>
Cc:     "Kangjie Lu" <kjlu@umn.edu>, linux-rtc@vger.kernel.org,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Maxime Ripard" <mripard@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: Re: [PATCH] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <CAGb2v640zTha1tzjOo3L+=T=N3hDRG+8qf2xu+bD8BMUnkhORQ@mail.gmail.com>
References: <20200823075815.23457-1-dinghao.liu@zju.edu.cn>
 <CAGb2v640zTha1tzjOo3L+=T=N3hDRG+8qf2xu+bD8BMUnkhORQ@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6de4a430.8e03.17429fa786d.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgD3n51yI0ZfOXIzAg--.52907W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgwEBlZdtPrA+AABsw
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbGCS07vEb7Iv0x
        C_JF4lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r43MIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
        xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
        FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
        AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
        0EY4v20xvaj40_WFyUJVCq3wCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUU==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBPbiBTdW4sIEF1ZyAyMywgMjAyMCBhdCAzOjU5IFBNIERpbmdoYW8gTGl1IDxkaW5naGFvLmxp
dUB6anUuZWR1LmNuPiB3cm90ZToKPiA+Cj4gPiBXaGVuIGNsa19od19yZWdpc3Rlcl9maXhlZF9y
YXRlX3dpdGhfYWNjdXJhY3koKSBmYWlscywKPiA+IGNsa19kYXRhIHNob3VsZCBiZSBmcmVlZC4g
SXQncyB0aGUgc2FtZSBmb3IgdGhlIHN1YnNlcXVlbnQKPiA+IGVycm9yIHBhdGhzLgo+IAo+IEkg
c3VwcG9zZSB5b3Ugc2hvdWxkIGFsc28gdW5yZWdpc3RlciB0aGUgYWxyZWFkeSByZWdpc3RlcmVk
IGNsb2Nrcwo+IGluIHRoZSBsYXR0ZXIgdHdvIGVycm9yIHBhdGhzPwo+IAoKU291bmRzIHJlYXNv
bmFibGUuIEJ1dCBJIGZpbmQgdGhhdCB0aGUgZXhpc3Rpbmcga2VybmVsIGNvZGUgdGFrZXMgZGlm
ZmVyZW50CnN0cmF0ZWdpZXMgZm9yIHRoaXMgY2FzZS4gb2Zfc2FtYTVkNF9zY2tjX3NldHVwKCkg
dXNlcyBjbGtfaHdfdW5yZWdpc3RlcigpIAphZnRlciBjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0
ZV93aXRoX2FjY3VyYWN5KCksIHdoaWxlIF9vZl9maXhlZF9jbGtfc2V0dXAoKQp1c2VzIGNsa19o
d191bnJlZ2lzdGVyX2ZpeGVkX3JhdGUoKS4gQnV0IGF0OTFzYW05MjZ4X3BtY19zZXR1cCgpIGp1
c3QgZG9lcwpub3RoaW5nIGluIHRoaXMgY2FzZS4KCkFsc28sIHRjb25fY2gxX3NldHVwKCkgdXNl
cyBjbGtfdW5yZWdpc3RlcigpIGFmdGVyIGNsa19yZWdpc3RlcigpLCB3aGlsZQpjbGtfcmVnaXN0
ZXJfdmNvX3BsbCgpIGp1c3QgZG9lcyBub3RoaW5nLiAKClNvIEknbSBub3Qgc3VyZSBpZiB3ZSBz
aG91bGQgcmVnaXN0ZXIgaGVyZSBhbmQgd2hpY2ggdW5yZWdpc3RlciBmdW5jdGlvbiB0byAKdXNl
LiBXb3VsZCB5b3UgcGxlYXNlIGdpdmUgbWUgbW9yZSBzcGVjaWZpYyBhZHZpY2UgYWJvdXQgdGhp
cyBwcm9ibGVtPwoKUmVnYXJkcywKRGluZ2hhbw==
