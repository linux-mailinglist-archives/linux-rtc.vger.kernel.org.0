Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EA42D0789
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgLFWHV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:21 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:60488 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgLFWHV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:21 -0500
Message-Id: <20201206214613.444124194@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=KObSc0K1pBLS9rSTAK3AbTQkXjPSUYUwBnpYGcrZNug=;
        b=uMomc2GVTGj5mqAYA251hvofM94+bmi5YDNIdLNgpuku6DzVakjrirz1VH8djNZ0svQ2sV
        16osW7ijlZos7/JazX0aLjZx+i0jmuhKBi4Bd/94SfVSrTvwoGhkIWtwA8caDbDANdFIA0
        gcf2A6GM8c3//VsV5bbenk+JEpSfBRPKlHCLrW9gYiWRFbbvMdPBQquJeAGf0DXOv7bo0e
        rWyOPeA9+nr0leP2dcv9ziOROYdwxhdociAjoiACZwkcFmsPMUGspG7q+XNCMTn5+UZBlZ
        uwTtvhP6p+Ol/WioR3LGHznlY13SfO4/qtJNNwPAOCoHpGR8mtL6qVquMr6Avg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=KObSc0K1pBLS9rSTAK3AbTQkXjPSUYUwBnpYGcrZNug=;
        b=xCxxD/u6hznY5+kajPYzbslzbbLm08sG8gwRlDrK2R71L4CsIfWOGKaHTmaDNfeb97/lke
        NNh9DTjHPII2usDw==
Date:   Sun, 06 Dec 2020 22:46:13 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 0/8] ntp/rtc: Fixes and cleanups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

TWlyb3NsYXYgcmFuIGludG8gYSBzaXR1YXRpb24gd2hlcmUgdGhlIHBlcmlvZGljIFJUQyBzeW5j
aHJvbml6YXRpb24gYWxtb3N0Cm5ldmVyIHdhcyBhYmxlIHRvIGhpdCB0aGUgdGltZSB3aW5kb3cg
Zm9yIHRoZSB1cGRhdGUuIFRoYXQgaGFwcGVucyBkdWUgdGhlCnVzYWdlIG9mIGRlbGF5ZWRfd29y
ayBhbmQgdGhlIHByb3BlcnRpZXMgb2YgdGhlIHRpbWVyIHdoZWVsLgoKV2hpbGUgdGhhdCBwYXJ0
aWN1bGFyIHByb2JsZW0gaXMgaGFsZndheXMgc2ltcGxlIHRvIGZpeCB0aGlzIHN0YXJ0ZWQgdG8K
dW5lYXJ0aCBvdGhlciBwcm9ibGVtcyB3aXRoIHRoYXQgY29kZSBwYXJ0aWN1bGFybHkgd2l0aCBy
dGNfc2V0X25wdF90aW1lKCkKYnV0IGV4cGFuZGVkIGludG8gb3RoZXIgdGhpbmdzIGFzIHdlbGwu
CgogIDEpIFRoZSB1cGRhdGUgb2Zmc2V0IGZvciBydGMtY21vcyBpcyBvZmYgYnkgYSBmdWxsIHNl
Y29uZAoKICAyKSBUaGUgcmVhZG91dCBvZiBNQzE0NjgxOCAocnRjLWNtb3MgYW5kIGFyY2ggY29k
ZSkgaXMgYnJva2VuIGFuZCBjYW4KICAgICByZXR1cm4gZ2FyYmFnZS4KCiAgMikgQWxleGFuZHJl
IHF1ZXN0aW9uZWQgdGhlIGFwcHJvYWNoIGluIGdlbmVyYWwgYW5kIHdhbnRzIHRvIGdldCByaWQg
b2YKICAgICBpdC4gT2YgY291cnNlIHRoZXJlIGFyZSBiZXR0ZXIgbWV0aG9kcyB0byBkbyB0aGF0
IGFuZCBpdCBjYW4gYmUKICAgICBjb21wbGV0ZWx5IGRvbmUgaW4gdXNlciBzcGFjZS4KCiAgICAg
VW5mb3J0dW5hdGVseSBpdCdzIG5vdCB0aGF0IHNpbXBsZSBhcyB0aGlzIHdvdWxkIGJlIGEgdXNl
ciB2aXNpYmxlCiAgICAgY2hhbmdlLCBzbyBtYWtpbmcgaXQgYXQgbGVhc3QgaGFsZndheXMgY29y
cmVjdC4KCiAgMykgQWxleGFuZHJlIHJlcXVlc3RlZCB0byBtb3ZlIHRoYXQgY29kZSBpbnRvIHRo
ZSBOVFAgY29kZSBhcyB0aGlzIGlzIG5vdAogICAgIHJlYWxseSBSVEMgZnVuY3Rpb25hbGl0eSBh
bmQganVzdCB1c2FnZSBvZiB0aGUgUlRDIEFQSS4KCiAgNCkgVGhlIHVwZGF0ZSBvZmZzZXQgaXRz
ZWxmIHdhcyBxdWVzdGlvbmVkLCBidXQgdGhlIHRpbWUgYmV0d2VlbiB0aGUKICAgICB3cml0ZSBh
bmQgdGhlIG5leHQgc2Vjb25kcyBpbmNyZW1lbnQgaW4gdGhlIFJUQyBpcyBmdW5kYW1lbnRhbHkg
YQogICAgIGhhcmR3YXJlIHByb3BlcnR5LiBUaGUgdHJhbnNwb3J0IHRpbWUsIHdoaWNoIGlzIHBy
ZXR0eSBpcnJlbGV2YW50IGZvcgogICAgIGRpcmVjdCBhY2Nlc3NpYmxlIFJUQ3MgKHJ0Yy1jbW9z
KSwgYnV0IHJlbGV2YW50IGZvciBSVEMgYmVoaW5kIGkyYy9TUEkKICAgICBuZWVkcyB0byBiZSBh
ZGRlZCBvbiB0b3AuCgogICAgIEl0J3MgdW5kZWJhdGVkIHRoYXQgdGhpcyB0cmFuc3BvcnQgdGlt
ZSBjYW5ub3QgYmUgY29ycmVjdGx5IGVzdGltYXRlZCwKICAgICBidXQgcmlnaHQgbm93IGl0J3Mg
NTAwbXMgd2hpY2ggaXMgZmFyIG9mZi4gVGhlIGNvcnJlY3QgdHJhbnNwb3J0IHRpbWUKICAgICBj
YW4gYmUgY2FsaWJyYXRlZCwgYSBoYWxmd2F5cyBjb3JyZWN0IHZhbHVlIHN1cHBsaWVkIHZpYSBE
VCwgYnV0CiAgICAgdGhhdCdzIGFuIG9ydGhvZ29uYWwgcHJvYmxlbS4KClRoZSBmb2xsb3dpbmcg
c2VyaWVzIGFkZHJlc3NlcyB0aGUgYWJvdmU6CgogICAgMSkgRml4IHRoZSByZWFkb3V0IGZ1bmN0
aW9uIG9mIE1DMTQ2ODE4CiAgICAyKSBGaXggdGhlIHJ0Yy1jbW9zIG9mZnNldAogICAgMykgUmVk
dWNlIHRoZSBkZWZhdWx0IHRyYW5zcG9ydCB0aW1lCgogICAgNCkgU3dpdGNoIHRoZSBOVFAgcGVy
aW9kaWMgc3luYyBjb2RlIHRvIGEgaHJ0aW1lci93b3JrIGNvbWJvCgogICAgNSkgTW92ZSBydGNf
c2V0X25wdF90aW1lKCkgdG8gdGhlIG50cCBjb2RlCiAgICA2KSBNYWtlIHRoZSB1cGRhdGUgb2Zm
c2V0IG1vcmUgaW50dWl0aXZlCiAgICA3KSBTaW1wbGlmeSB0aGUgd2hvbGUgbWFjaGluZXJ5CiAg
ICAgClRoYW5rcywKCgl0Z2x4Ci0tLQogYS9kcml2ZXJzL3J0Yy9zeXN0b2hjLmMgICAgICAgIHwg
ICA2MSAtLS0tLS0tLS0tCiBkcml2ZXJzL3J0Yy9NYWtlZmlsZSAgICAgICAgICAgfCAgICAxIAog
ZHJpdmVycy9ydGMvY2xhc3MuYyAgICAgICAgICAgIHwgICAgOSArCiBkcml2ZXJzL3J0Yy9ydGMt
Y21vcy5jICAgICAgICAgfCAgICAzIAogZHJpdmVycy9ydGMvcnRjLW1jMTQ2ODE4LWxpYi5jIHwg
ICA3MCArKysrKysrLS0tLS0KIGluY2x1ZGUvbGludXgvcnRjLmggICAgICAgICAgICB8ICAgNjkg
KysrKystLS0tLS0tCiBpbmNsdWRlL2xpbnV4L3RpbWV4LmggICAgICAgICAgfCAgICAxIAoga2Vy
bmVsL3RpbWUvbnRwLmMgICAgICAgICAgICAgIHwgIDIzMiArKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLQoga2VybmVsL3RpbWUvbnRwX2ludGVybmFsLmggICAgIHwgICAg
NyArCiA5IGZpbGVzIGNoYW5nZWQsIDIyNSBpbnNlcnRpb25zKCspLCAyMjggZGVsZXRpb25zKC0p
CgoKCg==
