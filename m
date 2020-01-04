Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2C98130113
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Jan 2020 06:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgADFrE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Jan 2020 00:47:04 -0500
Received: from spam01.hygon.cn ([110.188.70.11]:4025 "EHLO spam2.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725730AbgADFrE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 4 Jan 2020 00:47:04 -0500
Received: from MK-DB.hygon.cn ([172.23.18.60])
        by spam2.hygon.cn with ESMTP id 0045im2M097126;
        Sat, 4 Jan 2020 13:44:48 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex02.Hygon.cn ([172.23.18.12])
        by MK-DB.hygon.cn with ESMTP id 0045iU15039501;
        Sat, 4 Jan 2020 13:44:30 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex02.Hygon.cn
 (172.23.18.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Sat, 4 Jan 2020
 13:44:37 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Sat, 4 Jan 2020 13:44:37 +0800
From:   Jinke Fan <fanjinke@hygon.cn>
To:     Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     J William Piggott <elseifthen@gmx.com>,
        Karel Zak <kzak@redhat.com>,
        "util-linux@vger.kernel.org" <util-linux@vger.kernel.org>,
        "Linux List Kernel Mailing" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right
 time
Thread-Topic: [bugreport] "hwclock -w" reset time instead of setting the right
 time
Thread-Index: AQHVwUPPCOndCXxy/kq06ofHR9RHFKfWsTqAgAANMwCAABYVAIAAHY0AgAAhJgCAAAUoAIABGNMAgAACcoCAAAJRgIAAQ/aAgAEBiwA=
Date:   Sat, 4 Jan 2020 05:44:37 +0000
Message-ID: <7c015680-01b7-9c3e-c4c7-5d0b6e964781@hygon.cn>
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
In-Reply-To: <CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A30C6A09286B04B8F20B66F564B44E2@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn 0045im2M097126
X-DNSRBL: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgTWlrZSwNClRoZSByb290IGNhdXNlIG9mIHRoZSBidWcgeW91IGVuY291bnRlcmVkIGlzIHVu
Y2xlYXIuDQoNCkkgYWxzbyB0ZXN0ZWQgaXQgYXQgIkFNRCBSeXplbiA3IDM3MDBYIiB3aXRoIG1h
aW5ib2FyZCAiQVNVUyBST0cgU1RSSVgNClg1NzAtRSBHQU1JTkciLiBrZXJuZWwgdmVyc2lvbiBh
cmUgbGludXMgNS41LjAtcmM0IGFuZCBmZWRvcmENCjUuNS4wLTAucmM0LmdpdDAuMS5mYzMyLng4
Nl82NC4NCg0KW3Jvb3RAYm9nb24gIF0jIGh3Y2xvY2sgLXYNCmh3Y2xvY2sgZnJvbSB1dGlsLWxp
bnV4IDIuMzUtcmMxLTIwLTYzZjgNClN5c3RlbSBUaW1lOiAxNTc4MTEwNjcwLjU2ODUzOQ0KVHJ5
aW5nIHRvIG9wZW46IC9kZXYvcnRjMA0KVXNpbmcgdGhlIHJ0YyBpbnRlcmZhY2UgdG8gdGhlIGNs
b2NrLg0KTGFzdCBkcmlmdCBhZGp1c3RtZW50IGRvbmUgYXQgMCBzZWNvbmRzIGFmdGVyIDE5NjkN
Ckxhc3QgY2FsaWJyYXRpb24gZG9uZSBhdCAwIHNlY29uZHMgYWZ0ZXIgMTk2OQ0KSGFyZHdhcmUg
Y2xvY2sgaXMgb24gVVRDIHRpbWUNCkFzc3VtaW5nIGhhcmR3YXJlIGNsb2NrIGlzIGtlcHQgaW4g
VVRDIHRpbWUuDQpXYWl0aW5nIGZvciBjbG9jayB0aWNrLi4uDQouLi5nb3QgY2xvY2sgdGljaw0K
VGltZSByZWFkIGZyb20gSGFyZHdhcmUgQ2xvY2s6IDIwMjAvMDEvMDQgMDQ6MDQ6MzENCkh3IGNs
b2NrIHRpbWUgOiAyMDIwLzAxLzA0IDA0OjA0OjMxID0gMTU3ODExMDY3MSBzZWNvbmRzIHNpbmNl
IDE5NjkNClRpbWUgc2luY2UgbGFzdCBhZGp1c3RtZW50IGlzIDE1NzgxMTA2NzEgc2Vjb25kcw0K
Q2FsY3VsYXRlZCBIYXJkd2FyZSBDbG9jayBkcmlmdCBpcyAwLjAwMDAwMCBzZWNvbmRzDQoyMDIw
LTAxLTA0IDEyOjA0OjMwLjc2NDQyNiswODowMA0KW3Jvb3RAYm9nb24gIF0jDQpbcm9vdEBib2dv
biAgXSMgaHdjbG9jayAtdyAtdg0KaHdjbG9jayBmcm9tIHV0aWwtbGludXggMi4zNS1yYzEtMjAt
NjNmOA0KU3lzdGVtIFRpbWU6IDE1NzgxMTA2OTYuOTk5ODQ4DQpUcnlpbmcgdG8gb3BlbjogL2Rl
di9ydGMwDQpVc2luZyB0aGUgcnRjIGludGVyZmFjZSB0byB0aGUgY2xvY2suDQpMYXN0IGRyaWZ0
IGFkanVzdG1lbnQgZG9uZSBhdCAwIHNlY29uZHMgYWZ0ZXIgMTk2OQ0KTGFzdCBjYWxpYnJhdGlv
biBkb25lIGF0IDAgc2Vjb25kcyBhZnRlciAxOTY5DQpIYXJkd2FyZSBjbG9jayBpcyBvbiBVVEMg
dGltZQ0KQXNzdW1pbmcgaGFyZHdhcmUgY2xvY2sgaXMga2VwdCBpbiBVVEMgdGltZS4NClJUQyB0
eXBlOiAncnRjX2Ntb3MnDQpVc2luZyBkZWxheTogMC41MDAwMDAgc2Vjb25kcw0KMTU3ODExMDY5
Ny41MDAwMDAgaXMgY2xvc2UgZW5vdWdoIHRvIDE1NzgxMTA2OTcuNTAwMDAwICgwLjAwMDAwMCA8
IDAuMDAxMDAwKQ0KU2V0IFJUQyB0byAxNTc4MTEwNjk3ICgxNTc4MTEwNjk3ICsgMDsgcmVmc3lz
dGltZSA9IDE1NzgxMTA2OTcuMDAwMDAwKQ0KU2V0dGluZyBIYXJkd2FyZSBDbG9jayB0byAwNDow
NDo1NyA9IDE1NzgxMTA2OTcgc2Vjb25kcyBzaW5jZSAxOTY5DQppb2N0bChSVENfU0VUX1RJTUUp
IHdhcyBzdWNjZXNzZnVsLg0KTm90IGFkanVzdGluZyBkcmlmdCBmYWN0b3IgYmVjYXVzZSB0aGUg
LS11cGRhdGUtZHJpZnQgb3B0aW9uIHdhcyBub3QgdXNlZC4NCk5ldyAvZXRjL2FkanRpbWUgZGF0
YToNCjAuMDAwMDAwIDE1NzgxMTA2OTcgMC4wMDAwMDANCjE1NzgxMTA2OTcNClVUQw0KW3Jvb3RA
Ym9nb24gIF0jIGh3Y2xvY2sgLXYNCmh3Y2xvY2sgZnJvbSB1dGlsLWxpbnV4IDIuMzUtcmMxLTIw
LTYzZjgNClN5c3RlbSBUaW1lOiAxNTc4MTEwNzIwLjcxNjA5NA0KVHJ5aW5nIHRvIG9wZW46IC9k
ZXYvcnRjMA0KVXNpbmcgdGhlIHJ0YyBpbnRlcmZhY2UgdG8gdGhlIGNsb2NrLg0KTGFzdCBkcmlm
dCBhZGp1c3RtZW50IGRvbmUgYXQgMTU3ODExMDY5NyBzZWNvbmRzIGFmdGVyIDE5NjkNCkxhc3Qg
Y2FsaWJyYXRpb24gZG9uZSBhdCAxNTc4MTEwNjk3IHNlY29uZHMgYWZ0ZXIgMTk2OQ0KSGFyZHdh
cmUgY2xvY2sgaXMgb24gVVRDIHRpbWUNCkFzc3VtaW5nIGhhcmR3YXJlIGNsb2NrIGlzIGtlcHQg
aW4gVVRDIHRpbWUuDQpXYWl0aW5nIGZvciBjbG9jayB0aWNrLi4uDQouLi5nb3QgY2xvY2sgdGlj
aw0KVGltZSByZWFkIGZyb20gSGFyZHdhcmUgQ2xvY2s6IDIwMjAvMDEvMDQgMDQ6MDU6MjENCkh3
IGNsb2NrIHRpbWUgOiAyMDIwLzAxLzA0IDA0OjA1OjIxID0gMTU3ODExMDcyMSBzZWNvbmRzIHNp
bmNlIDE5NjkNClRpbWUgc2luY2UgbGFzdCBhZGp1c3RtZW50IGlzIDI0IHNlY29uZHMNCkNhbGN1
bGF0ZWQgSGFyZHdhcmUgQ2xvY2sgZHJpZnQgaXMgMC4wMDAwMDAgc2Vjb25kcw0KMjAyMC0wMS0w
NCAxMjowNToyMC45MjA4MDMrMDg6MDANCltyb290QGJvZ29uICBdIw0KW3Jvb3RAYm9nb24gIF0j
IHJlYm9vdA0KDQpbcm9vdEBib2dvbiAgXSMgaHdjbG9jayAtdg0KaHdjbG9jayBmcm9tIHV0aWwt
bGludXggMi4zNS1yYzEtMjAtNjNmOA0KU3lzdGVtIFRpbWU6IDE1NzgxMTA5NTkuMTQ0NDcyDQpU
cnlpbmcgdG8gb3BlbjogL2Rldi9ydGMwDQpVc2luZyB0aGUgcnRjIGludGVyZmFjZSB0byB0aGUg
Y2xvY2suDQpMYXN0IGRyaWZ0IGFkanVzdG1lbnQgZG9uZSBhdCAxNTc4MTEwNjk3IHNlY29uZHMg
YWZ0ZXIgMTk2OQ0KTGFzdCBjYWxpYnJhdGlvbiBkb25lIGF0IDE1NzgxMTA2OTcgc2Vjb25kcyBh
ZnRlciAxOTY5DQpIYXJkd2FyZSBjbG9jayBpcyBvbiBVVEMgdGltZQ0KQXNzdW1pbmcgaGFyZHdh
cmUgY2xvY2sgaXMga2VwdCBpbiBVVEMgdGltZS4NCldhaXRpbmcgZm9yIGNsb2NrIHRpY2suLi4N
Ci4uLmdvdCBjbG9jayB0aWNrDQpUaW1lIHJlYWQgZnJvbSBIYXJkd2FyZSBDbG9jazogMjAyMC8w
MS8wNCAwNDowOToyMA0KSHcgY2xvY2sgdGltZSA6IDIwMjAvMDEvMDQgMDQ6MDk6MjAgPSAxNTc4
MTEwOTYwIHNlY29uZHMgc2luY2UgMTk2OQ0KVGltZSBzaW5jZSBsYXN0IGFkanVzdG1lbnQgaXMg
MjYzIHNlY29uZHMNCkNhbGN1bGF0ZWQgSGFyZHdhcmUgQ2xvY2sgZHJpZnQgaXMgMC4wMDAwMDAg
c2Vjb25kcw0KMjAyMC0wMS0wNCAxMjowOToxOS4zNTgxOTErMDg6MDANCltyb290QGJvZ29uICBd
IyBkbWVzZyB8Z3JlcCAtaSBydGMNClsgICAgMC4xMjcyMjZdIFBNOiBSVEMgdGltZTogMDQ6MDY6
NTksIGRhdGU6IDIwMjAtMDEtMDQNClsgICAgMS41NDY0MTFdIHJ0Y19jbW9zIDAwOjAzOiBSVEMg
Y2FuIHdha2UgZnJvbSBTNA0KWyAgICAxLjU0NjUzMl0gcnRjX2Ntb3MgMDA6MDM6IHJlZ2lzdGVy
ZWQgYXMgcnRjMA0KWyAgICAxLjU0NjUzM10gcnRjX2Ntb3MgMDA6MDM6IGFsYXJtcyB1cCB0byBv
bmUgbW9udGgsIHkzaywgMTE0IGJ5dGVzIA0KbnZyYW0sIGhwZXQgaXJxcw0KWyAgICAxLjU4OTE1
N10gcnRjX2Ntb3MgMDA6MDM6IHNldHRpbmcgc3lzdGVtIGNsb2NrIHRvIA0KMjAyMC0wMS0wNFQw
NDowNzowMSBVVEMgKDE1NzgxMTA4MjEpDQpbcm9vdEBib2dvbiAgXSMNCg0KVGhlcmUgaXMgbm8g
ZGF0ZSByZXNldCBmb3VuZCBpbiB0aGUgYmlvcyBhZnRlciByZWJvb3QuDQpUaGUgZmlyc3QgdGlt
ZSBkdXJpbmcgT1Mgc3RhcnR1cCBnZXQgZGF0ZSBmcm9tIHJ0Y19jbW9zIGlzOg0KWyAgICAxLjU4
OTE1N10gcnRjX2Ntb3MgMDA6MDM6IHNldHRpbmcgc3lzdGVtIGNsb2NrIHRvIA0KMjAyMC0wMS0w
NFQwNDowNzowMSBVVEMgKDE1NzgxMTA4MjEpDQoNCkkgd2F0Y2hlZCB0aGUgdmlkZW8gb24geW91
dHViZS4gVGhlIGRhdGUgaXMgcmVzZXRlZCB3aGVuIHN0YXJ0dXAgaW50byANCmJpb3MgYXQgTWlr
ZSdzIHBsYXRmb3JtLg0KQXMgd2Uga25vdyB0aGF0IHRoZSBiaW9zIHdpbGwgY2hlY2sgdGhlIHZh
bGlkaXR5IG9mIHJ0YyB0aW1lLCBpZiBub3QsIA0KYmlvcyB3aWxsIHJlc2V0IHRoZSBydGMgdGlt
ZS4gUlRDIHRpbWUgcmVzZXQgbWF5IGJlIGRvbmUgYnkgdGhlIEJJT1MuDQoNCldoYXRldmVyIEkn
bSBzbyBzb3JyeSBmb3IgdGhlIGlzc3VlLg0KDQpCZXN0IHJlZ2FyZHMuDQpKaW5rZSBGYW4NCg0K
T24gMjAyMC8xLzMgMjI6MjIsIE1pa2hhaWwgR2F2cmlsb3Ygd3JvdGU6DQo+IE9uIEZyaSwgMyBK
YW4gMjAyMCBhdCAxNToxOSwgQWxleGFuZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5iZWxsb25p
QGJvb3RsaW4uY29tPiB3cm90ZToNCj4+IEknbSBnb2luZyB0byByZXZlcnQgN2FkMjk1ZDUxOTZh
NThjMjJhYmVjZWY2MmRkNGY5OWUyZjg2ZTgzMSwgSSB0aGluaw0KPj4gdGhpcyB3aWxsIHNvbHZl
IHRoaXMgaXNzdWUuDQo+Pg0KPiANCj4gSnVzdCBjaGVja2VkIGtlcm5lbCB3aXRoIHJldmVydGVk
IGNvbW1pdA0KPiA3YWQyOTVkNTE5NmE1OGMyMmFiZWNlZjYyZGQ0Zjk5ZTJmODZlODMxLA0KPiBh
bmQgSSBjYW4gY29uZmlybSB0aGF0IGFueSB0aW1lIGNvdWxkIGJlIHN1Y2Nlc3NmdWxseSBzZXQg
dmlhICdod2Nsb2NrIC13Jy4NCj4gVGhhbmtzLCB3YWl0aW5nIGZvciB0aGUgcGF0Y2ggaW4gbWFz
dGVyLg0KPiANCj4gLS0NCj4gQmVzdCBSZWdhcmRzLA0KPiBNaWtlIEdhdnJpbG92Lg0KPiANCg==
