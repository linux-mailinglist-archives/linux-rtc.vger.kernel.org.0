Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D569E130231
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Jan 2020 12:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgADLhp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Jan 2020 06:37:45 -0500
Received: from spam01.hygon.cn ([110.188.70.11]:32510 "EHLO spam2.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725796AbgADLhp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 4 Jan 2020 06:37:45 -0500
Received: from MK-DB.hygon.cn ([172.23.18.60])
        by spam2.hygon.cn with ESMTP id 004BZbW0030090;
        Sat, 4 Jan 2020 19:35:37 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
        by MK-DB.hygon.cn with ESMTP id 004BZSkj086529;
        Sat, 4 Jan 2020 19:35:29 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Sat, 4 Jan 2020
 19:35:36 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Sat, 4 Jan 2020 19:35:36 +0800
From:   Jinke Fan <fanjinke@hygon.cn>
To:     Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        J William Piggott <elseifthen@gmx.com>,
        Karel Zak <kzak@redhat.com>,
        "util-linux@vger.kernel.org" <util-linux@vger.kernel.org>,
        "Linux List Kernel Mailing" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right
 time
Thread-Topic: [bugreport] "hwclock -w" reset time instead of setting the right
 time
Thread-Index: AQHVwUPPCOndCXxy/kq06ofHR9RHFKfWsTqAgAANMwCAABYVAIAAHY0AgAAhJgCAAAUoAIABGNMAgAACcoCAAAJRgIAAQ/aAgAEBiwCAACzsgIAANSSA
Date:   Sat, 4 Jan 2020 11:35:36 +0000
Message-ID: <6ac1d65c-33ac-e3a4-799f-24279b677f90@hygon.cn>
References: <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10>
 <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
 <20200102131434.tky2hquki23laqqo@10.255.255.10>
 <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
 <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz>
 <CABXGCsMLfarquWnzV=e3Ta_HPac+DALfKEOaD3rp5n9MPqgyFw@mail.gmail.com>
 <20200103100232.GH3040@piout.net>
 <CABXGCsNv7G94TxaaKX8KXL5DEJiFgNcSu4+WShE_kQjVSa7zZA@mail.gmail.com>
 <20200103101935.GI3040@piout.net>
 <CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com>
 <7c015680-01b7-9c3e-c4c7-5d0b6e964781@hygon.cn>
 <CABXGCsNpS+nCMZ9C89UQVEu_u+hJVtdxCvdnj2QNqQf-j7+DrA@mail.gmail.com>
In-Reply-To: <CABXGCsNpS+nCMZ9C89UQVEu_u+hJVtdxCvdnj2QNqQf-j7+DrA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <92D765153CD03C42949B4AC8A36A7A7A@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn 004BZbW0030090
X-DNSRBL: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgTWlrZToNClllcywgV2UgZG8gY2hlY2sgdGhlIHRpbWUgaW4gQklPUyBNZW51IGFmdGVyIGZp
cnN0IHJlYm9vdC4NCg0KV2UgZG8gc29tZSBmdXJ0aGVyIHRlc3RzIGluIG91ciBYNTcwIHBsYXRm
b3JtOg0KKiAiQU1EIFJ5emVuIDcgMzcwMFgiIHdpdGggbWFpbmJvYXJkICJBU1VTIFJPRyBTVFJJ
WCBYNTcwLUUgR0FNSU5HIi4NCiogT1MgaXMgRmVkb3JhIHJhd2hpZGUsIHdpdGggZGVmYXVsdCBL
ZXJuZWwgdmVyc2lvbiB3aGljaCBpcyBzaG93biBhcyANCmZvbGxvd3M6DQokdW5hbWUgLWENCkxp
bnV4IGJvZ29uIDUuNS4wLTAucmM0LmdpdDAuMS5mYzMyLng4Nl82NCAjMSBTTVAgTW9uIERlYyAz
MCAwNjozMjozNiANClVUQyAyMDE5IHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eA0KDQpB
bmQgd2UgdXBncmFkZS9kb3duZ3JhZGUgQklPUyB2ZXJzaW9uIGZyb20gMTAwNS8xMjAxLzE0MDQv
MTQwNSwgYW5kIHdlIA0KZm91bmQgb3V0IHRoYXQgOg0KKiBPTEQgQklPUyB2ZXJzaW9uIDEwMDUv
MTIwMSBkb2VzIG5vdCByZXNldCB0aGUgcnRjIHRpbWUgYW5kIGtlZXAgdGhlIA0Kc2V0dXAgcnRj
IHRpbWUgYWZ0ZXIgcmVib290Lg0KKiBORVcgQklPUyB2ZXJzaW9uIDE0MDQvMTQwNSBETyByZXNl
dCB0aGUgcnRjIHRpbWUgdG8gMjAxOS8wMS8wMSBhZnRlciANCnJlYm9vdC4NCg0KRGV0YWlsZWQg
cGljdHVyZXMgb2YgdGhlIEJJT1MgdGltZSBhZnRlciByZWJvb3QgaXMgc2hvd24gaW4gWzJdLA0K
DQpXZSBzdXNwZWN0IHRoZSBCSU9TIDEyMDEtPjE0MDQgdXBncmFkZSBtaWdodCBjYXVzZSB0aGlz
IGlzc3VlLg0KIEZyb20geDU3MCBCSU9TIGNoYW5nZWxvZyBbMV0sIHdlIGZvdW5kIHRoYXQgdGhl
IGJpZyBkaWZmZXJlbmNlIGJldHdlZW4gDQoxMjAxLzE0MDQgaXMgdGhlIEFNRCBBTTQgUEkgdXBn
cmFkZSBmcm9tIEFHRVNBIDEuMC4wLjNBQkJBIHRvIEFNNCBjb21ibyANClBJIDEuMC4wLjQgcGF0
Y2ggQiwNCg0KSWYgcG9zc2libGUsIHBsZWFzZSB0ZWxsIHVzIGFib3V0IHRoZSBCSU9TIHZlcnNp
b24gYW5kIHlvdXIgaGFyZHdhcmUgDQpwbGF0Zm9ybSwNCndoaWNoIGNhbiBiZSBnZXQgZnJvbSBC
SU9TIFVJIG9yIHVzaW5nICJkbWlkZWNvZGUiIGluIExpbnV4IGVudi4NCg0KUmVmZXJlbmNlOg0K
WzFdOiANCmh0dHBzOi8vd3d3LmFzdXMuY29tL01vdGhlcmJvYXJkcy9ST0ctU3RyaXgtWDU3MC1F
LUdhbWluZy9IZWxwRGVza19CSU9TLw0KWzJdOmh0dHBzOi8vZ2l0aHViLmNvbS9mamtiby9ydGMN
Cmh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9mamtiby9ydGMvbWFzdGVyLzEwMDUu
anBnDQpodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vZmprYm8vcnRjL21hc3Rlci8x
MjAxLmpwZw0KaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2Zqa2JvL3J0Yy9tYXN0
ZXIvMTQwNC5qcGcNCmh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9mamtiby9ydGMv
bWFzdGVyLzE0MDUuanBnDQoNCi0tIA0KQmVzdCBSZWdhcmRzLA0KSmlua2UgRmFuLg0KDQpPbiAy
MDIwLzEvNCAxNjoyNSwgTWlraGFpbCBHYXZyaWxvdiB3cm90ZToNCj4gT24gU2F0LCA0IEphbiAy
MDIwIGF0IDEwOjQ2LCBKaW5rZSBGYW4gPGZhbmppbmtlQGh5Z29uLmNuPiB3cm90ZToNCj4+DQo+
PiBJIHdhdGNoZWQgdGhlIHZpZGVvIG9uIHlvdXR1YmUuIFRoZSBkYXRlIGlzIHJlc2V0ZWQgd2hl
biBzdGFydHVwIGludG8NCj4+IGJpb3MgYXQgTWlrZSdzIHBsYXRmb3JtLg0KPj4gQXMgd2Uga25v
dyB0aGF0IHRoZSBiaW9zIHdpbGwgY2hlY2sgdGhlIHZhbGlkaXR5IG9mIHJ0YyB0aW1lLCBpZiBu
b3QsDQo+PiBiaW9zIHdpbGwgcmVzZXQgdGhlIHJ0YyB0aW1lLiBSVEMgdGltZSByZXNldCBtYXkg
YmUgZG9uZSBieSB0aGUgQklPUy4NCj4gDQo+IERpZCB5b3UgZGlzYWJsZSBhdXRvbWF0aWMgdGlt
ZSBzeW5jaHJvbml6YXRpb24/DQo+IEJ5IGRlZmF1bHQgRmVkb3JhIEdOT01FIGRvaW5nIGF1dG9t
YXRpYyB0aW1lIHN5bmNocm9uaXphdGlvbi4NCj4gRm9yIHRoaXMgcmVhc29uLCBpdOKAmXMgbW9y
ZSBjb3JyZWN0IHRvIGltbWVkaWF0ZWx5IGdvIGludG8gdGhlIEJJT1MNCj4gYWZ0ZXIgYSByZWJv
b3QgYW5kIHRoZXJlIGNoZWNrIHRoZSB0aW1lIHZhbHVlIG9yIHR1cm4gb2ZmIGF1dG9tYXRpYw0K
PiB0aW1lIHN5bmNocm9uaXphdGlvbg0KPiANCj4gLS0NCj4gQmVzdCBSZWdhcmRzLA0KPiBNaWtl
IEdhdnJpbG92Lg0KPiANCg==
