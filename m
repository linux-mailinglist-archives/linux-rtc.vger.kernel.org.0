Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C342610260
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2019 00:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbfD3WbX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 18:31:23 -0400
Received: from mail-eopbgr720135.outbound.protection.outlook.com ([40.107.72.135]:26752
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726049AbfD3WbW (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 30 Apr 2019 18:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7JwGOlbx1AbXFguFHLajH7K1ZhljEf5PLbxOYRrE+M=;
 b=VBObJYNyMcV5u2aD2t6r/tpJqK7rAqqa7IsnA4uH7fEQTx2bgHzkLi1Pm0Gb5jDlkWFEwWk1bSzdPlVROpmnIej+mH0SXgfVUXaUiR1mxe6tt7swFS9srptQwpFNCNCeQJeVuf1n/fNWeNCFyjNBb0fdTY+EPpb0mAebyOjReEM=
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3738.namprd06.prod.outlook.com (10.167.236.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 22:31:19 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d6d:7e4b:d2ff:5e29]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d6d:7e4b:d2ff:5e29%3]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 22:31:19 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "patrice.chotard@st.com" <patrice.chotard@st.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: st-lpc: remove unnecessary check
Thread-Topic: [PATCH] rtc: st-lpc: remove unnecessary check
Thread-Index: AQHU/5H32hcx4X+jhEK8dI4HvkdrpqZVSbiA
Date:   Tue, 30 Apr 2019 22:31:19 +0000
Message-ID: <1556663479.31309.36.camel@impinj.com>
References: <20190430201834.12634-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20190430201834.12634-1-alexandre.belloni@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tpiepho@impinj.com; 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17cc9cd4-7af0-4970-84a8-08d6cdbb9147
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR0601MB3738;
x-ms-traffictypediagnostic: MWHPR0601MB3738:
x-microsoft-antispam-prvs: <MWHPR0601MB37386880D9DAED61321E0EB1D33A0@MWHPR0601MB3738.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39850400004)(396003)(346002)(136003)(376002)(199004)(189003)(66946007)(66446008)(64756008)(73956011)(66556008)(66476007)(8936002)(305945005)(91956017)(68736007)(76116006)(66066001)(53936002)(7736002)(6246003)(3846002)(2501003)(71200400001)(71190400001)(86362001)(2201001)(229853002)(110136005)(54906003)(6512007)(81166006)(81156014)(76176011)(99286004)(8676002)(4326008)(2906002)(36756003)(6506007)(6486002)(103116003)(478600001)(6436002)(102836004)(25786009)(316002)(26005)(186003)(486006)(6116002)(14454004)(5660300002)(476003)(2616005)(446003)(11346002)(256004)(14444005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3738;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: impinj.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tx8lNRcAz/7F3aldfFtEXp9Fue9YisqVqVeSvZwAkO2pGM4xRotWBhifOmISGOBjbIYoeHEYLlcWHChHZ53ILTj9iEuo7kv3CQ/0iwcWSIFo9OgjG/WF9v4JEuEn+hqZA0X48NT1CBzz9RpKIWJzDa62qbcuXUVpLJcNT/dzkQr6WXmiGkcOnYePvGNzjdGt9IUaHX3dHP4LSS3ih0Y46JLZXfVIt6+3rISSdGgxMvV81x7Uio7qXHeX6/nwn5LZ0/37ybPTjmW+Fo/o9WTTt4plChGSUDistxHz+3BbMXTVCDA/3xaZwPNn2bmRnqYLrfhqa2cTPCW5OiZwbYwFSVcCKgeQi8r2J1m78HS1tLAUpNkBvGJcYnsrf4OMr40lWselt7g2fA8dcadRapL0wlrn3L/lOkxJl4Wq6ouHbTk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <352C3F422848634E83D54198D4A165FD@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cc9cd4-7af0-4970-84a8-08d6cdbb9147
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 22:31:19.8484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3738
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVHVlLCAyMDE5LTA0LTMwIGF0IDIyOjE4ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90
ZToNCj4gVGhlIFJUQyBjb3JlIGFscmVhZHkgZW5zdXJlcyB0aGUgYWxhcm0gaXMgc2V0IHRvIGEg
dGltZSBpbiB0aGUgZnV0dXJlLCBpdA0KPiBpcyBub3QgbmVjZXNzYXJ5IHRvIGNoZWNrIGFnYWlu
IGluIHRoZSBkcml2ZXIuDQoNCk15IHJlYWRpbmcgb2YgdGhlIHJ0YyBjb3JlIGNvZGUgaXMgdGhh
dCBpdCBjaGVja3MgaWYgdGhlIGFsYXJtIGlzIGluDQp0aGUgZnV0dXJlICp0d2ljZSogYmVmb3Jl
IGhhbmRpbmcgb2ZmIHRoZSBzZXQgY2FsbCB0byB0aGUgZHJpdmVyLCB3aGljaA0KcG9zc2libHkg
Y2hlY2tzIGEgM3JkIHRpbWUgKGFzIHNlZW4gaGVyZSkuDQoNCkhvd2V2ZXIsIGFsbCB0aGVzZSBj
aGVja3MgYXJlIGRvbmUgKmJlZm9yZSogc2V0dGluZyB0aGUgYWxhcm0uICBJdA0Kc3RpbGwgcG9z
c2libGUgdG8gaGF2ZSBhIHJhY2UgYW5kIHNldCB0aGUgYWxhcm0gYWZ0ZXIgdGhlIHRpbWUgaGFz
DQphbHJlYWR5IHBhc3NlZCwgaW4gd2hpY2ggY2FzZSB0aGUgYWxhcm0gd2lsbCBuZXZlciBmaXJl
Lg0KDQpUaGUgd2F5IHRvIGZpeCB0aGUgcmFjZSB3b3VsZCBiZSB0byBoYXZlIHRoZSBkcml2ZXIg
Y2hlY2sgdGhlIGFsYXJtDQoqYWZ0ZXIqIHNldHRpbmcgaXQuICBJbiBwcmVjaXNlbHkgdGhpcyBv
cmRlciwgZG8gdGhlc2Ugc3RlcHM6DQoNCjEuIFNldCBhbGFybSBpbiBSVEMsIHRvIFRhbGFybQ0K
Mi4gR2V0IHRpbWUgZnJvbSBSVEMsIGFzIFRjdXJyZW50DQozLiBHZXQgYWxhcm0gc3RhdHVzIGZy
b20gUlRDDQoNCklmIFRhbGFybSA8IFRjdXJyZW50LCBhbGFybSB3YXMgc2V0IHRvIGZ1dHVyZSB0
aW1lLCBubyBlcnJvcg0KRWxzZQ0KICBJZiBzdGF0dXMgPT0gZmlyZWQsIGFsYXJtIHdhcyBzZXQg
YW5kIGhhcyBzaW5jZSBmaXJlZCwgbm8gZXJyb3INCiAgRWxzZSBzdGF0dXMgPT0gbm90IGZpcmVk
LCBhbGFybSB3YXMgc2V0IGluIHBhc3QsIEVJTlZBTA0KDQpUaGlzIHNob3VsZCBiZSByYWNlIGZy
ZWUuDQoNCg0KPiAgDQo+IC0JLyogSW52YWxpZCBhbGFybSB0aW1lICovDQo+IC0JaWYgKG5vd19z
ZWNzID4gYWxhcm1fc2VjcykNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0NCj4gIAltZW1jcHko
JnJ0Yy0+YWxhcm0sIHQsIHNpemVvZihzdHJ1Y3QgcnRjX3drYWxybSkpOw0KPiAgDQo+ICAJLyog
Tm93IG1hbnkgc2VjcyB0byBmaXJlICovDQogICAgICAgIGFsYXJtX3NlY3MgLT0gbm93X3NlY3M7
DQogICAgICAgIGxwYSA9ICh1bnNpZ25lZCBsb25nIGxvbmcpYWxhcm1fc2VjcyAqIHJ0Yy0+Y2xr
cmF0ZTsNCg0KV2hpbGUgaXQncyB0cnVlIHRoZSB0aW1lIHdvdWxkbid0IG5vcm1hbGx5IGJlIGlu
IHBhc3QsIGl0IHN0aWxsIHJhY2VzLA0KYXMgZGVzY3JpYmUgYWJvdmUuIEluIHRoYXQgY2FzZSwg
dGhlIG1hdGggaGVyZSB1bmRlcmZsb3dzIGFsYXJtX3NlY3MsDQpzbyBpdCBwcm9iYWJseSBzdGls
bCBtYWtlcyBzZW5zZSB0byBjaGVjay4=
