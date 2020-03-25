Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC2C191EB7
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2020 02:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgCYBuk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Mar 2020 21:50:40 -0400
Received: from mail-eopbgr00049.outbound.protection.outlook.com ([40.107.0.49]:2117
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727211AbgCYBuj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 24 Mar 2020 21:50:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxTXALi/u9X4RQuI6mqvPERbbfZSCpVVc2fgZN0i3rHAsQLrBCt7lERPfOu55BPJb6drNlU4ecjUwwQGlPUGhNpgujwQ787CZeZQn6Q4zwmJRE9DkHho8LZPUgzUBTsyXkTSMUVTh4OKd6+Y+r83mJ0mU1sym56pxyIjhJnaXg1bE0zJhA0YysRqiVHHYIAtRYsyxXAL1SZ8NNB0PTCvZYkYqCYQrtEMjxIqpG+T10Yg4+5NGsWtDCFlStNJPX+pD/pu6cZ8SL1Rf28U8mFEpcKKVCNWWbLsJ7KTKKCJOFDHky9/+n1SXT0FdFF8JGco8kfCEClpbjPJv5azipF/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl1c+xg0kbTCKRfgL5ei0JQpgyHzUpAgE5DykBJr3d4=;
 b=D+jqOlB1P1OW5iRLxc8TFMemNlreEvD9QqxgXL5/HCoZsLo+Q7oLvstySOm3DpojUrPEpjaW2sh6eutKeJvkaHJhrUD+u/UjDOfpASj57iCj0ahKyAJLldSwKrkYCTYjnzJXc12MeoiOHCXfoUmix17RCvi3qZYBKb3YiVDzeUkVkWpxlInMJV6l9zYr48+7yuZ3OkbbqwseZX7+4ZVyw68GaBQhYd3bjCxBV5Bh+9C9PdjeqJ7rQQ+T24oOqJZt5wC2uZX2Yf2S88pLf4AuvoRnfszu0PEQL1bbBulRk7cIXpB0Ygz/LGqa+Wgl1vDJnoARxB1te3cgS62oQqA9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl1c+xg0kbTCKRfgL5ei0JQpgyHzUpAgE5DykBJr3d4=;
 b=KZdsbvwLZ0GVhvpChasplxwLnzQFI7EXzjhhaQ5W/yPbj7e9EbmUIsTyhK+rAiRD/RN/h+NfS1QL9HF4mtGZn1mmyPhHKRcvdv2CoH/i+iEQyFb76qX0HDUQctzzMtpeiV78tHTximzzmkpPm2Fnb3ikHWJsl7q2rg0dA0ieKA0=
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com (52.135.58.214) by
 AM7PR04MB6997.eurprd04.prod.outlook.com (10.141.174.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Wed, 25 Mar 2020 01:50:35 +0000
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa]) by AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 01:50:35 +0000
From:   Peng Ma <peng.ma@nxp.com>
To:     YueHaibing <yuehaibing@huawei.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH -next] rtc: fsl-ftm-alarm: remove set but not used
 variable 'np'
Thread-Topic: [PATCH -next] rtc: fsl-ftm-alarm: remove set but not used
 variable 'np'
Thread-Index: AQHWAaqGtBlhx83TwkW7jOFF9AzPUKhYi1LQ
Date:   Wed, 25 Mar 2020 01:50:35 +0000
Message-ID: <AM7PR04MB70165A5F952E4A3FE3A4EF8BEDCE0@AM7PR04MB7016.eurprd04.prod.outlook.com>
References: <20200324070336.59972-1-yuehaibing@huawei.com>
In-Reply-To: <20200324070336.59972-1-yuehaibing@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a599c8b-49a5-455d-c83c-08d7d05ee961
x-ms-traffictypediagnostic: AM7PR04MB6997:
x-microsoft-antispam-prvs: <AM7PR04MB6997E15B8F2CD4164FD298A9EDCE0@AM7PR04MB6997.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(86362001)(316002)(33656002)(478600001)(54906003)(44832011)(81166006)(9686003)(81156014)(55016002)(71200400001)(64756008)(8936002)(6506007)(2906002)(4326008)(5660300002)(66446008)(8676002)(110136005)(66946007)(66556008)(76116006)(186003)(7696005)(66476007)(52536014)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB6997;H:AM7PR04MB7016.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CbT+yuXzf6SP5m//PUiJKtgXf33hFfjqgohRX/E1ECaDyd2DY1iWKalJNp1h8LgL2msw+lpG8lDeMI0RRZlCvanKvkrly/9eG1+Rwkby0hV3vAC1fO1GcbVz74OVNDc2zsTMVd0/xvIghAk5REccisl/kGb2cSZLqaM9s/zTEm7JaFUTfVlnS03GtVL0bgXFXKVXCKtTgSAiG6aUwCD8P/YkzQfhPNtCn4Ghkw7LSxi+JL3Qt2PtC4sOketdu16CwLNnD9o4IBdr5ZOklM6wsDc/tdLST5axzCcgf5uH4peLVp0CMeumlgBHVLu3bYhOmTLYDSrUZWVURVvS7YlR7+/BxgazurunNxCJ7KaXJbF2B9VcclSUKCHRig7f9v0QE1zNI+n26g8Uk47HO7ybcveI9rmaNMnKj2GqYZsRizPWym5jhYThd3ejxQct4qbrxi+aQA/5nZ/7TGkVW/Ov4MCwXq971CrqgUilMAsa2fZGXoFP1dJif/pm9eJQC9Na80PKGBr4S1v+sg+f5pmrrQ==
x-ms-exchange-antispam-messagedata: 6QNHlqSwtgr/DERw1O/gvoWCF1yY5RLz0x69tLZq+eLDhhnUSYMy9mJgpqDBpOTDIoAQsIYFnudBjYmqGNlGGT+k6j1Rl3RErT6Gi/MlATuC/QFD/gzjx/u031QlxSLeYiJWNFmyl4cJtdPAaiUd2Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a599c8b-49a5-455d-c83c-08d7d05ee961
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 01:50:35.6331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7YumK3meG4i0a68uQlN5RiANnmVysJS27eRBzwdGWVT8MYygVPpSlKWUZqzNIcl9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFl1ZUhhaWJpbmcgPHl1ZWhh
aWJpbmdAaHVhd2VpLmNvbT4NCj5TZW50OiAyMDIwxOoz1MIyNMjVIDE1OjA0DQo+VG86IGEuenVt
bW9AdG93ZXJ0ZWNoLml0OyBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbQ0KPkNjOiBsaW51
eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQZW5n
IE1hDQo+PHBlbmcubWFAbnhwLmNvbT47IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNv
bT4NCj5TdWJqZWN0OiBbUEFUQ0ggLW5leHRdIHJ0YzogZnNsLWZ0bS1hbGFybTogcmVtb3ZlIHNl
dCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ25wJw0KPg0KPmRyaXZlcnMvcnRjL3J0Yy1mc2wtZnRt
LWFsYXJtLmM6IEluIGZ1bmN0aW9uICdmdG1fcnRjX3Byb2JlJzoNCj5kcml2ZXJzL3J0Yy9ydGMt
ZnNsLWZ0bS1hbGFybS5jOjI0NjoyMjogd2FybmluZzogdW51c2VkIHZhcmlhYmxlICducCcNCj5b
LVd1bnVzZWQtdmFyaWFibGVdDQo+ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2
Lm9mX25vZGU7DQo+ICAgICAgICAgICAgICAgICAgICAgIF5+DQo+Y29tbWl0IGNkNDliNTc5ZTcw
NSAoInJ0YzogZnNsLWZ0bS1hbGFybTogZW5hYmxlIGFjcGkgc3VwcG9ydCIpIGxlZnQgYmVoaW5k
DQo+dGhpcywgcmVtb3ZlIGl0Lg0KPg0KPlNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhh
aWJpbmdAaHVhd2VpLmNvbT4NCj4tLS0NCj4gZHJpdmVycy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0u
YyB8IDEgLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPg0KPmRpZmYgLS1naXQg
YS9kcml2ZXJzL3J0Yy9ydGMtZnNsLWZ0bS1hbGFybS5jIGIvZHJpdmVycy9ydGMvcnRjLWZzbC1m
dG0tYWxhcm0uYyBpbmRleA0KPmM1NzIwNDRmZjA2ZS4uMGY0MTQyYjM1ZjM4IDEwMDY0NA0KPi0t
LSBhL2RyaXZlcnMvcnRjL3J0Yy1mc2wtZnRtLWFsYXJtLmMNCj4rKysgYi9kcml2ZXJzL3J0Yy9y
dGMtZnNsLWZ0bS1hbGFybS5jDQo+QEAgLTI0Myw3ICsyNDMsNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJ0Y19jbGFzc19vcHMgZnRtX3J0Y19vcHMgPSB7DQo+DQo+IHN0YXRpYyBpbnQgZnRtX3J0
Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAgew0KPi0Jc3RydWN0IGRldmlj
ZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOw0KW1BlbmcgTWFdIEhpLCBIYWlCaW5nLA0K
DQpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHRoaXMgcGF0Y2ggaGFzIGFscmVhZHkgaW4gdXBzdHJl
YW0oaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEyMTQwMTQvKQ0KDQpC
ZXN0IFJlZ2FyZHMsDQpQZW5nDQo+IAlpbnQgaXJxOw0KPiAJaW50IHJldDsNCj4gCXN0cnVjdCBm
dG1fcnRjICpydGM7DQo+LS0NCj4yLjE3LjENCj4NCg0K
