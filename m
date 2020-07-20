Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F39225BFE
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jul 2020 11:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgGTJq4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jul 2020 05:46:56 -0400
Received: from mail-eopbgr1300050.outbound.protection.outlook.com ([40.107.130.50]:41248
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727062AbgGTJqz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 20 Jul 2020 05:46:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qv4IsS1uwuQFxEM74pUkITtptaIpd/TODGZMwz/soBkc/xwy0Flk/iLzPgODAPDVkbi2JN+vfyYzabUrOdP/xSRaRhJkCtyT4lDWEiT23pqqQ8QBfI+DZ38siZp/SfJyTon3UymX+SDc4TU4RARxH49lVNUwxXbGHsgMrXQMZ41YXN+3BMptc6gP0/RtcWVEuY+4FPkh0HZbyy7lTOeAR8TiVj0Lb0TgnxHN22xFk1xfC3iLnuKeSqg/b4INpo2gVDo4ZGyozzo0LFnmO4h8SqRE6NKwe4bPDYMeP0oxrxI87nDleLf33zjjTv8XhPw9QJliY856gzADe9hXrU+ExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIhKVrcz2atag2n1UD7pJrkSB4+nnfxerAkDAtFatNE=;
 b=T1/lEqMv5yacLFXV1z5wfEAEtFzEllgmSeRJUMB5c1pW5YrxHFVNDYh1rEH1DhGljZ3v3/1CUIKBalBSayzuAxGjSb7qs4U8Eq36PoTMmpQIYev2VDLZkoj/41+jJJSatH47qO+/GRVL/V/75jlqzPQf0AlBxdgV0j1K0L6873fMfTE0bWH31vQ3DjVtknGHVk24dyRjqQQOZNmYgo9/wI4x515eiK3XSz9hj/V70Mrj+EuKMBU2xQB8mouNgWWsKh/Mz5yGdghTOfnbo1ftBzb9ATmbrcSG/UhRU8el/ERBvCAyTkNPDJce/0vn7yyek8yLaPwS9DMVBn2H6ky02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIhKVrcz2atag2n1UD7pJrkSB4+nnfxerAkDAtFatNE=;
 b=g9tcpa4/9+EzDJmO0U+2+HW7TKbxnHLQQb0IJutKSxrNP6qd7OA+Q7pGStHI+vYZZMyyUpi7YngwHuII/9Ehq+kR0hcw9aPUbHa8pbkoEmo6nyNHBs49fLBZXEyp8GUJvSQW8qHsnZ/Wr/oDpN2AzW8jnAmnpJb6/DyJjVN7Io8=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK0PR01MB2401.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Mon, 20 Jul
 2020 09:46:45 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77%4]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 09:46:45 +0000
From:   =?big5?B?Sm9obnNvbiBDSCBDaGVuICizr6xMvrEp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v5] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog part
Thread-Topic: [PATCH v5] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Thread-Index: AQHWXnkat6/TbeWp0Uerbrrj6duJcQ==
Date:   Mon, 20 Jul 2020 09:46:45 +0000
Message-ID: <HK2PR01MB32811CE9FE5DB463A69E94C8FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17023e8f-2650-4792-556c-08d82c91d0d6
x-ms-traffictypediagnostic: HK0PR01MB2401:
x-microsoft-antispam-prvs: <HK0PR01MB240111EE44815AED3B28774DFA7B0@HK0PR01MB2401.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q4wpi19SFwqEOuGPSCvNNkLatYtIcC2EDiyninHvYNKr9DhtfzEDYA9oJ/kMJzXL4LNX0JSB/Tos27tmtewv2p885iKUFMwuP3mhU4mflEfbGuaNCz+D3CRrkCl5+vCDK5a0ErBXUYA3HRwh8CxHgrpQcgHQuxQ27t1aDUTA3rRZGn6rbCtnppnDwPGDNoeVE6k15LN6TAIaefxMYCT4WsbLIAQGMCtyaVdbIsnOhGHLn/A3V6UWFFT+vnYBBSw6Kg620K+MzkqPwFcYKb0P65dqsW6JSAAvhYEGB6jJOviQ/cIREg2dNUiZg4PbQSGa8P0AiT4q352XveSYxKyq3VIzAB6autq67/tM+3kfTUkVHi3ykY5xvIPMqeEWRQRZOAAJ89JqwOC2QfaHojBRTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(396003)(346002)(366004)(376002)(136003)(30864003)(83380400001)(7696005)(8936002)(66946007)(71200400001)(85182001)(4326008)(9686003)(55016002)(33656002)(66446008)(66556008)(76116006)(86362001)(316002)(5660300002)(2906002)(8676002)(64756008)(186003)(6506007)(110136005)(52536014)(54906003)(478600001)(26005)(66476007)(171213001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: mLpdOx1dZeRtd7UwT32pUk6HIjlpp59i3i7MmEppaA16tAtkPwDOB2LQgAtLtMZbMS+NLgXbkL+h5Nh0Ocq0PJZOcYN4RJITj1lw6wfiandJv8ueqXUQIlJNtPx4xCY7lXlr0fq9dkysrpox4aO3uLlg3a3zCpXCe9PmtvmDYWPk3tSbdH2ITYhvxb1za8yKPpRwKE90YOO0IqMtMMr4EKPyLj9AVk/JBbZL5ENoaMgkdnziqa76xaSmTTw/w7ZWQpXkCzeaTrM7gCZ+Nu452A6GxEfHElioDWoLq0mU6oOkQIYHTQJICqMoe0a4Y3tbyn01b5fpflwuCDuKnv9FdHAMP+nZdTNMDKlRj/vA3vvhImmNbmZo7wGz6X1QL+8tWew4NRpLTcrOik4jeEPheWij9Phrmv388ysjMIFR2fPjIv2az/foDKH9p4TOeX6jhmIcaumdVzH+JvQLGy9g5F7t2/CGVLjMKyJRrjVSNag=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR01MB3281.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17023e8f-2650-4792-556c-08d82c91d0d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 09:46:45.7603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B61zL1/5VM5zZdRhX9KwwZJ16qgX3woqW7U8UAIr+MjSsG/3ebOlXqZuQYnsoOe04vS9D8YhiFdnQmTP/f/LBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR01MB2401
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

TGV0IGRzMTM3NCB3YXRjaGRvZyB1c2Ugd2F0Y2hkb2cgY29yZSBmdW5jdGlvbnMuIEl0IGFsc28g
aW5jbHVkZXMKaW1wcm92aW5nIHdhdGNoZG9nIHRpbWVyIHNldHRpbmcgYW5kIG5vd2F5b3V0LCBh
bmQganVzdCB1c2VzIGlvY3RsKCkKb2Ygd2F0Y2hkb2cgY29yZS4KClNpZ25lZC1vZmYtYnk6IEpv
aG5zb24gQ2hlbiA8am9obnNvbmNoLmNoZW5AbW94YS5jb20+ClJlcG9ydGVkLWJ5OiBSYW5keSBE
dW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KLS0tCnY0LT52NToKLSBGaXggcmVwb3J0ZWQg
YnVpbGQgZXJyb3IgYnkgcmVwbGFjaW5nIFJUQ19EUlZfRFMxMzc0X1dEVCB3aXRoIFdBVENIRE9H
X0NPUkUKCnYzLT52NDoKLSBGaXggY29kaW5nIHN0eWxlcyAKLSBSZW1vdmUgZGV2X2luZm8oKSBp
biBkczEzNzRfd2R0X3NldHRpbWVvdXQoKQotIEZpeCBtaXNzaW5nIGVycm9yIGNoZWNrCgp2Mi0+
djM6Ci0gRml4IGEgcHJvYmxlbSByZXBvcnRlZCBieSBXQVRDSERPR19DT1JFIGlmIFdBVENIRE9H
Ci0gUmVtb3ZlIHNhdmVfY2xpZW50Ci0gTGV0IHdkdF9tYXJnaW4gYmUgMCBmb3Igd2F0Y2hkb2df
aW5pdF90aW1lb3V0KCkKLSBVc2UgZGV2X2luZm8oKSByYXRoZXIgdGhhbiBwcl9pbmZvKCkKLSBB
dm9pZCBtb3JlIHN0cmluZ3MgaW4gdGhpcyBkcml2ZXIKCnYxLT52MjoKLSBVc2UgZHMxMzc0X3dk
dF9zZXR0aW1lb3V0KCkgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSB3YXRjaGRvZwotIFJlbW92ZSB3
YXRjaGRvZ191bnJlZ2lzdGVyX2RldmljZSgpIGJlY2F1c2UgZGV2bV93YXRjaGRvZ19yZWdpc3Rl
cl9kZXZpY2UoKSBpcyB1c2VkCi0gUmVtb3ZlIGRzMTM3NF93ZHRfcGluZygpCi0gVElNRVJfTUFS
R0lOX01BWCB0byA0MDk1IGZvciAyNC1iaXQgdmFsdWUKLSBLZWVwIHdkdF9tYXJnaW4KLSBGaXgg
Y29kaW5nIHN0eWxlcwoKIGRyaXZlcnMvcnRjL0tjb25maWcgICAgICB8ICAxMyArLQogZHJpdmVy
cy9ydGMvcnRjLWRzMTM3NC5jIHwgMjcyICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCAyMTMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvS2NvbmZpZyBiL2RyaXZlcnMvcnRjL0tjb25m
aWcKaW5kZXggYjU0ZDg3ZDQ1Yzg5Li5mY2M0N2E2MTM2MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
cnRjL0tjb25maWcKKysrIGIvZHJpdmVycy9ydGMvS2NvbmZpZwpAQCAtMjcxLDIyICsyNzEsMTcg
QEAgY29uZmlnIFJUQ19EUlZfRFMxMzA3X0NFTlRVUlkKIAogY29uZmlnIFJUQ19EUlZfRFMxMzc0
CiAJdHJpc3RhdGUgIkRhbGxhcy9NYXhpbSBEUzEzNzQiCisJc2VsZWN0IFdBVENIRE9HX0NPUkUg
aWYgV0FUQ0hET0cKIAloZWxwCiAJICBJZiB5b3Ugc2F5IHllcyBoZXJlIHlvdSBnZXQgc3VwcG9y
dCBmb3IgRGFsbGFzIFNlbWljb25kdWN0b3IKIAkgIERTMTM3NCByZWFsLXRpbWUgY2xvY2sgY2hp
cHMuIElmIGFuIGludGVycnVwdCBpcyBhc3NvY2lhdGVkCi0JICB3aXRoIHRoZSBkZXZpY2UsIHRo
ZSBhbGFybSBmdW5jdGlvbmFsaXR5IGlzIHN1cHBvcnRlZC4KKwkgIHdpdGggdGhlIGRldmljZSwg
dGhlIGFsYXJtIGZ1bmN0aW9uYWxpdHkgaXMgc3VwcG9ydGVkLiBJZgorCSAgV0FUQ0hET0dfQ09S
RSBpcyBlbmFibGVkLCBEYWxsYXMvTWF4aW0gRFMxMzc0IHdhdGNoZG9nIHRpbWVyCisJICBpcyBz
dXBwb3J0ZWQgcmF0aGVyIHRoYW4gYWxhcm0gdGltZXIuCiAKIAkgIFRoaXMgZHJpdmVyIGNhbiBh
bHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLiBJZiBzbywgdGhlIG1vZHVsZQogCSAgd2lsbCBiZSBj
YWxsZWQgcnRjLWRzMTM3NC4KIAotY29uZmlnIFJUQ19EUlZfRFMxMzc0X1dEVAotCWJvb2wgIkRh
bGxhcy9NYXhpbSBEUzEzNzQgd2F0Y2hkb2cgdGltZXIiCi0JZGVwZW5kcyBvbiBSVENfRFJWX0RT
MTM3NAotCWhlbHAKLQkgIElmIHlvdSBzYXkgWSBoZXJlIHlvdSB3aWxsIGdldCBzdXBwb3J0IGZv
ciB0aGUKLQkgIHdhdGNoZG9nIHRpbWVyIGluIHRoZSBEYWxsYXMgU2VtaWNvbmR1Y3RvciBEUzEz
NzQKLQkgIHJlYWwtdGltZSBjbG9jayBjaGlwcy4KLQogY29uZmlnIFJUQ19EUlZfRFMxNjcyCiAJ
dHJpc3RhdGUgIkRhbGxhcy9NYXhpbSBEUzE2NzIiCiAJaGVscApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ydGMvcnRjLWRzMTM3NC5jIGIvZHJpdmVycy9ydGMvcnRjLWRzMTM3NC5jCmluZGV4IDljNTFh
MTJjZjcwZi4uZmM2NDcwZjVjODQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtZHMxMzc0
LmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLWRzMTM3NC5jCkBAIC0yOSw3ICsyOSw3IEBACiAjaW5j
bHVkZSA8bGludXgvd29ya3F1ZXVlLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogI2luY2x1
ZGUgPGxpbnV4L3BtLmg+Ci0jaWZkZWYgQ09ORklHX1JUQ19EUlZfRFMxMzc0X1dEVAorI2lmZGVm
IENPTkZJR19XQVRDSERPR19DT1JFCiAjaW5jbHVkZSA8bGludXgvZnMuaD4KICNpbmNsdWRlIDxs
aW51eC9pb2N0bC5oPgogI2luY2x1ZGUgPGxpbnV4L21pc2NkZXZpY2UuaD4KQEAgLTQ2LDYgKzQ2
LDcgQEAKICNkZWZpbmUgRFMxMzc0X1JFR19XREFMTTIJMHgwNgogI2RlZmluZSBEUzEzNzRfUkVH
X0NSCQkweDA3IC8qIENvbnRyb2wgKi8KICNkZWZpbmUgRFMxMzc0X1JFR19DUl9BSUUJMHgwMSAv
KiBBbGFybSBJbnQuIEVuYWJsZSAqLworI2RlZmluZSBEUzEzNzRfUkVHX0NSX1dEU1RSCTB4MDgg
LyogMT1JTlQsIDA9UlNUICovCiAjZGVmaW5lIERTMTM3NF9SRUdfQ1JfV0RBTE0JMHgyMCAvKiAx
PVdhdGNoZG9nLCAwPUFsYXJtICovCiAjZGVmaW5lIERTMTM3NF9SRUdfQ1JfV0FDRQkweDQwIC8q
IFdEL0FsYXJtIGNvdW50ZXIgZW5hYmxlICovCiAjZGVmaW5lIERTMTM3NF9SRUdfU1IJCTB4MDgg
LyogU3RhdHVzICovCkBAIC03MSw3ICs3Miw5IEBAIHN0cnVjdCBkczEzNzQgewogCXN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQ7CiAJc3RydWN0IHJ0Y19kZXZpY2UgKnJ0YzsKIAlzdHJ1Y3Qgd29y
a19zdHJ1Y3Qgd29yazsKLQorI2lmZGVmIENPTkZJR19XQVRDSERPR19DT1JFCisJc3RydWN0IHdh
dGNoZG9nX2RldmljZSB3ZHQ7CisjZW5kaWYKIAkvKiBUaGUgbXV0ZXggcHJvdGVjdHMgYWxhcm0g
b3BlcmF0aW9ucywgYW5kIHByZXZlbnRzIGEgcmFjZQogCSAqIGJldHdlZW4gdGhlIGVuYWJsZV9p
cnEoKSBpbiB0aGUgd29ya3F1ZXVlIGFuZCB0aGUgZnJlZV9pcnEoKQogCSAqIGluIHRoZSByZW1v
dmUgZnVuY3Rpb24uCkBAIC0xNzcsNyArMTgwLDcgQEAgc3RhdGljIGludCBkczEzNzRfc2V0X3Rp
bWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRjX3RpbWUgKnRpbWUpCiAJcmV0dXJuIGRz
MTM3NF93cml0ZV9ydGMoY2xpZW50LCBpdGltZSwgRFMxMzc0X1JFR19UT0QwLCA0KTsKIH0KIAot
I2lmbmRlZiBDT05GSUdfUlRDX0RSVl9EUzEzNzRfV0RUCisjaWZuZGVmIENPTkZJR19XQVRDSERP
R19DT1JFCiAvKiBUaGUgZHMxMzc0IGhhcyBhIGRlY3JlbWVudGVyIGZvciBhbiBhbGFybSwgcmF0
aGVyIHRoYW4gYSBjb21wYXJhdG9yLgogICogSWYgdGhlIHRpbWUgb2YgZGF5IGlzIGNoYW5nZWQs
IHRoZW4gdGhlIGFsYXJtIHdpbGwgbmVlZCB0byBiZQogICogcmVzZXQuCkBAIC0zMjQsNyArMzI3
LDcgQEAgc3RhdGljIHZvaWQgZHMxMzc0X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQog
CW11dGV4X3VubG9jaygmZHMxMzc0LT5tdXRleCk7CiB9CiAKLSNpZm5kZWYgQ09ORklHX1JUQ19E
UlZfRFMxMzc0X1dEVAorI2lmbmRlZiBDT05GSUdfV0FUQ0hET0dfQ09SRQogc3RhdGljIGludCBk
czEzNzRfYWxhcm1faXJxX2VuYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBl
bmFibGVkKQogewogCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KGRl
dik7CkBAIC0zNTQsMTQgKzM1NywxNCBAQCBzdGF0aWMgaW50IGRzMTM3NF9hbGFybV9pcnFfZW5h
YmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGVuYWJsZWQpCiBzdGF0aWMgY29u
c3Qgc3RydWN0IHJ0Y19jbGFzc19vcHMgZHMxMzc0X3J0Y19vcHMgPSB7CiAJLnJlYWRfdGltZSA9
IGRzMTM3NF9yZWFkX3RpbWUsCiAJLnNldF90aW1lID0gZHMxMzc0X3NldF90aW1lLAotI2lmbmRl
ZiBDT05GSUdfUlRDX0RSVl9EUzEzNzRfV0RUCisjaWZuZGVmIENPTkZJR19XQVRDSERPR19DT1JF
CiAJLnJlYWRfYWxhcm0gPSBkczEzNzRfcmVhZF9hbGFybSwKIAkuc2V0X2FsYXJtID0gZHMxMzc0
X3NldF9hbGFybSwKIAkuYWxhcm1faXJxX2VuYWJsZSA9IGRzMTM3NF9hbGFybV9pcnFfZW5hYmxl
LAogI2VuZGlmCiB9OwogCi0jaWZkZWYgQ09ORklHX1JUQ19EUlZfRFMxMzc0X1dEVAorI2lmZGVm
IENPTkZJR19XQVRDSERPR19DT1JFCiAvKgogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKgpAQCAt
MzY5LDIzOSArMzcyLDk5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnRjX2NsYXNzX29wcyBkczEz
NzRfcnRjX29wcyA9IHsKICAqCiAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKICAqLwotc3RhdGljIHN0
cnVjdCBpMmNfY2xpZW50ICpzYXZlX2NsaWVudDsKIC8qIERlZmF1bHQgbWFyZ2luICovCi0jZGVm
aW5lIFdEX1RJTU8gMTMxNzYyCisjZGVmaW5lIFRJTUVSX01BUkdJTl9ERUZBVUxUCTMyCisjZGVm
aW5lIFRJTUVSX01BUkdJTl9NSU4JMQorI2RlZmluZSBUSU1FUl9NQVJHSU5fTUFYCTQwOTUgLyog
MjQtYml0IHZhbHVlICovCiAKICNkZWZpbmUgRFJWX05BTUUgIkRTMTM3NCBXYXRjaGRvZyIKIAot
c3RhdGljIGludCB3ZHRfbWFyZ2luID0gV0RfVElNTzsKLXN0YXRpYyB1bnNpZ25lZCBsb25nIHdk
dF9pc19vcGVuOworc3RhdGljIGludCB3ZHRfbWFyZ2luOwogbW9kdWxlX3BhcmFtKHdkdF9tYXJn
aW4sIGludCwgMCk7CiBNT0RVTEVfUEFSTV9ERVNDKHdkdF9tYXJnaW4sICJXYXRjaGRvZyB0aW1l
b3V0IGluIHNlY29uZHMgKGRlZmF1bHQgMzJzKSIpOwogCitzdGF0aWMgYm9vbCBub3dheW91dCA9
IFdBVENIRE9HX05PV0FZT1VUOworbW9kdWxlX3BhcmFtKG5vd2F5b3V0LCBib29sLCAwKTsKK01P
RFVMRV9QQVJNX0RFU0Mobm93YXlvdXQsICJXYXRjaGRvZyBjYW5ub3QgYmUgc3RvcHBlZCBvbmNl
IHN0YXJ0ZWQgKGRlZmF1bHQgPSIKKwkJX19NT0RVTEVfU1RSSU5HKFdBVENIRE9HX05PV0FZT1VU
KSIpIik7CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgd2F0Y2hkb2dfaW5mbyBkczEzNzRfd2R0X2lu
Zm8gPSB7CiAJLmlkZW50aXR5ICAgICAgID0gIkRTMTM3NCBXVEQiLAogCS5vcHRpb25zICAgICAg
ICA9IFdESU9GX1NFVFRJTUVPVVQgfCBXRElPRl9LRUVQQUxJVkVQSU5HIHwKIAkJCQkJCVdESU9G
X01BR0lDQ0xPU0UsCiB9OwogCi1zdGF0aWMgaW50IGRzMTM3NF93ZHRfc2V0dGltZW91dCh1bnNp
Z25lZCBpbnQgdGltZW91dCkKK3N0YXRpYyBpbnQgZHMxMzc0X3dkdF9zZXR0aW1lb3V0KHN0cnVj
dCB3YXRjaGRvZ19kZXZpY2UgKndkdCwgdW5zaWduZWQgaW50IHRpbWVvdXQpCiB7Ci0JaW50IHJl
dCA9IC1FTk9JT0NUTENNRDsKLQlpbnQgY3I7CisJc3RydWN0IGRzMTM3NCAqZHMxMzc0ID0gd2F0
Y2hkb2dfZ2V0X2RydmRhdGEod2R0KTsKKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gZHMx
Mzc0LT5jbGllbnQ7CisJaW50IHJldCwgY3I7CiAKLQlyZXQgPSBjciA9IGkyY19zbWJ1c19yZWFk
X2J5dGVfZGF0YShzYXZlX2NsaWVudCwgRFMxMzc0X1JFR19DUik7Ci0JaWYgKHJldCA8IDApCi0J
CWdvdG8gb3V0OworCXdkdC0+dGltZW91dCA9IHRpbWVvdXQ7CisKKwljciA9IGkyY19zbWJ1c19y
ZWFkX2J5dGVfZGF0YShjbGllbnQsIERTMTM3NF9SRUdfQ1IpOworCWlmIChjciA8IDApCisJCXJl
dHVybiBjcjsKIAogCS8qIERpc2FibGUgYW55IGV4aXN0aW5nIHdhdGNoZG9nL2FsYXJtIGJlZm9y
ZSBzZXR0aW5nIHRoZSBuZXcgb25lICovCiAJY3IgJj0gfkRTMTM3NF9SRUdfQ1JfV0FDRTsKIAot
CXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoc2F2ZV9jbGllbnQsIERTMTM3NF9SRUdf
Q1IsIGNyKTsKKwlyZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgRFMxMzc0
X1JFR19DUiwgY3IpOwogCWlmIChyZXQgPCAwKQotCQlnb3RvIG91dDsKKwkJcmV0dXJuIHJldDsK
IAogCS8qIFNldCBuZXcgd2F0Y2hkb2cgdGltZSAqLwotCXJldCA9IGRzMTM3NF93cml0ZV9ydGMo
c2F2ZV9jbGllbnQsIHRpbWVvdXQsIERTMTM3NF9SRUdfV0RBTE0wLCAzKTsKLQlpZiAocmV0KSB7
Ci0JCXByX2luZm8oImNvdWxkbid0IHNldCBuZXcgd2F0Y2hkb2cgdGltZVxuIik7Ci0JCWdvdG8g
b3V0OwotCX0KKwl0aW1lb3V0ID0gdGltZW91dCAqIDQwOTY7CisJcmV0ID0gZHMxMzc0X3dyaXRl
X3J0YyhjbGllbnQsIHRpbWVvdXQsIERTMTM3NF9SRUdfV0RBTE0wLCAzKTsKKwlpZiAocmV0KQor
CQlyZXR1cm4gcmV0OwogCiAJLyogRW5hYmxlIHdhdGNoZG9nIHRpbWVyICovCiAJY3IgfD0gRFMx
Mzc0X1JFR19DUl9XQUNFIHwgRFMxMzc0X1JFR19DUl9XREFMTTsKKwljciAmPSB+RFMxMzc0X1JF
R19DUl9XRFNUUjsvKiBmb3IgUlNUIFBJTiAqLwogCWNyICY9IH5EUzEzNzRfUkVHX0NSX0FJRTsK
IAotCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoc2F2ZV9jbGllbnQsIERTMTM3NF9S
RUdfQ1IsIGNyKTsKKwlyZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgRFMx
Mzc0X1JFR19DUiwgY3IpOwogCWlmIChyZXQgPCAwKQotCQlnb3RvIG91dDsKKwkJcmV0dXJuIHJl
dDsKIAogCXJldHVybiAwOwotb3V0OgotCXJldHVybiByZXQ7CiB9CiAKLQogLyoKICAqIFJlbG9h
ZCB0aGUgd2F0Y2hkb2cgdGltZXIuICAoaWUsIHBhdCB0aGUgd2F0Y2hkb2cpCiAgKi8KLXN0YXRp
YyB2b2lkIGRzMTM3NF93ZHRfcGluZyh2b2lkKQorc3RhdGljIGludCBkczEzNzRfd2R0X3N0YXJ0
KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdCkKIHsKKwlzdHJ1Y3QgZHMxMzc0ICpkczEzNzQg
PSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZHQpOwogCXUzMiB2YWw7Ci0JaW50IHJldCA9IDA7CiAK
LQlyZXQgPSBkczEzNzRfcmVhZF9ydGMoc2F2ZV9jbGllbnQsICZ2YWwsIERTMTM3NF9SRUdfV0RB
TE0wLCAzKTsKLQlpZiAocmV0KQotCQlwcl9pbmZvKCJXRCBUSUNLIEZBSUwhISEhISEhISEhICVp
XG4iLCByZXQpOworCXJldHVybiBkczEzNzRfcmVhZF9ydGMoZHMxMzc0LT5jbGllbnQsICZ2YWws
IERTMTM3NF9SRUdfV0RBTE0wLCAzKTsKIH0KIAotc3RhdGljIHZvaWQgZHMxMzc0X3dkdF9kaXNh
YmxlKHZvaWQpCitzdGF0aWMgaW50IGRzMTM3NF93ZHRfc3RvcChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2
aWNlICp3ZHQpCiB7CisJc3RydWN0IGRzMTM3NCAqZHMxMzc0ID0gd2F0Y2hkb2dfZ2V0X2RydmRh
dGEod2R0KTsKKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gZHMxMzc0LT5jbGllbnQ7CiAJ
aW50IGNyOwogCi0JY3IgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoc2F2ZV9jbGllbnQsIERT
MTM3NF9SRUdfQ1IpOworCWNyID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgRFMx
Mzc0X1JFR19DUik7CisJaWYgKGNyIDwgMCkKKwkJcmV0dXJuIGNyOworCiAJLyogRGlzYWJsZSB3
YXRjaGRvZyB0aW1lciAqLwogCWNyICY9IH5EUzEzNzRfUkVHX0NSX1dBQ0U7CiAKLQlpMmNfc21i
dXNfd3JpdGVfYnl0ZV9kYXRhKHNhdmVfY2xpZW50LCBEUzEzNzRfUkVHX0NSLCBjcik7Ci19Ci0K
LS8qCi0gKiBXYXRjaGRvZyBkZXZpY2UgaXMgb3BlbmVkLCBhbmQgd2F0Y2hkb2cgc3RhcnRzIHJ1
bm5pbmcuCi0gKi8KLXN0YXRpYyBpbnQgZHMxMzc0X3dkdF9vcGVuKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsIHN0cnVjdCBmaWxlICpmaWxlKQotewotCXN0cnVjdCBkczEzNzQgKmRzMTM3NCA9IGkyY19n
ZXRfY2xpZW50ZGF0YShzYXZlX2NsaWVudCk7Ci0KLQlpZiAoTUlOT1IoaW5vZGUtPmlfcmRldikg
PT0gV0FUQ0hET0dfTUlOT1IpIHsKLQkJbXV0ZXhfbG9jaygmZHMxMzc0LT5tdXRleCk7Ci0JCWlm
ICh0ZXN0X2FuZF9zZXRfYml0KDAsICZ3ZHRfaXNfb3BlbikpIHsKLQkJCW11dGV4X3VubG9jaygm
ZHMxMzc0LT5tdXRleCk7Ci0JCQlyZXR1cm4gLUVCVVNZOwotCQl9Ci0JCS8qCi0JCSAqICAgICAg
QWN0aXZhdGUKLQkJICovCi0JCXdkdF9pc19vcGVuID0gMTsKLQkJbXV0ZXhfdW5sb2NrKCZkczEz
NzQtPm11dGV4KTsKLQkJcmV0dXJuIHN0cmVhbV9vcGVuKGlub2RlLCBmaWxlKTsKLQl9Ci0JcmV0
dXJuIC1FTk9ERVY7Ci19Ci0KLS8qCi0gKiBDbG9zZSB0aGUgd2F0Y2hkb2cgZGV2aWNlLgotICov
Ci1zdGF0aWMgaW50IGRzMTM3NF93ZHRfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QgZmlsZSAqZmlsZSkKLXsKLQlpZiAoTUlOT1IoaW5vZGUtPmlfcmRldikgPT0gV0FUQ0hET0df
TUlOT1IpCi0JCWNsZWFyX2JpdCgwLCAmd2R0X2lzX29wZW4pOwotCi0JcmV0dXJuIDA7CisJcmV0
dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LCBEUzEzNzRfUkVHX0NSLCBjcik7
CiB9CiAKLS8qCi0gKiBQYXQgdGhlIHdhdGNoZG9nIHdoZW5ldmVyIGRldmljZSBpcyB3cml0dGVu
IHRvLgotICovCi1zdGF0aWMgc3NpemVfdCBkczEzNzRfd2R0X3dyaXRlKHN0cnVjdCBmaWxlICpm
aWxlLCBjb25zdCBjaGFyIF9fdXNlciAqZGF0YSwKLQkJCQlzaXplX3QgbGVuLCBsb2ZmX3QgKnBw
b3MpCi17Ci0JaWYgKGxlbikgewotCQlkczEzNzRfd2R0X3BpbmcoKTsKLQkJcmV0dXJuIDE7Ci0J
fQotCXJldHVybiAwOwotfQotCi1zdGF0aWMgc3NpemVfdCBkczEzNzRfd2R0X3JlYWQoc3RydWN0
IGZpbGUgKmZpbGUsIGNoYXIgX191c2VyICpkYXRhLAotCQkJCXNpemVfdCBsZW4sIGxvZmZfdCAq
cHBvcykKLXsKLQlyZXR1cm4gMDsKLX0KLQotLyoKLSAqIEhhbmRsZSBjb21tYW5kcyBmcm9tIHVz
ZXItc3BhY2UuCi0gKi8KLXN0YXRpYyBsb25nIGRzMTM3NF93ZHRfaW9jdGwoc3RydWN0IGZpbGUg
KmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCi0JCQkJCQkJdW5zaWduZWQgbG9uZyBhcmcpCi17Ci0J
aW50IG5ld19tYXJnaW4sIG9wdGlvbnM7Ci0KLQlzd2l0Y2ggKGNtZCkgewotCWNhc2UgV0RJT0Nf
R0VUU1VQUE9SVDoKLQkJcmV0dXJuIGNvcHlfdG9fdXNlcigoc3RydWN0IHdhdGNoZG9nX2luZm8g
X191c2VyICopYXJnLAotCQkmZHMxMzc0X3dkdF9pbmZvLCBzaXplb2YoZHMxMzc0X3dkdF9pbmZv
KSkgPyAtRUZBVUxUIDogMDsKLQotCWNhc2UgV0RJT0NfR0VUU1RBVFVTOgotCWNhc2UgV0RJT0Nf
R0VUQk9PVFNUQVRVUzoKLQkJcmV0dXJuIHB1dF91c2VyKDAsIChpbnQgX191c2VyICopYXJnKTsK
LQljYXNlIFdESU9DX0tFRVBBTElWRToKLQkJZHMxMzc0X3dkdF9waW5nKCk7Ci0JCXJldHVybiAw
OwotCWNhc2UgV0RJT0NfU0VUVElNRU9VVDoKLQkJaWYgKGdldF91c2VyKG5ld19tYXJnaW4sIChp
bnQgX191c2VyICopYXJnKSkKLQkJCXJldHVybiAtRUZBVUxUOwotCi0JCS8qIHRoZSBoYXJkd2Fy
ZSdzIHRpY2sgcmF0ZSBpcyA0MDk2IEh6LCBzbwotCQkgKiB0aGUgY291bnRlciB2YWx1ZSBuZWVk
cyB0byBiZSBzY2FsZWQgYWNjb3JkaW5nbHkKLQkJICovCi0JCW5ld19tYXJnaW4gPDw9IDEyOwot
CQlpZiAobmV3X21hcmdpbiA8IDEgfHwgbmV3X21hcmdpbiA+IDE2Nzc3MjE2KQotCQkJcmV0dXJu
IC1FSU5WQUw7Ci0KLQkJd2R0X21hcmdpbiA9IG5ld19tYXJnaW47Ci0JCWRzMTM3NF93ZHRfc2V0
dGltZW91dChuZXdfbWFyZ2luKTsKLQkJZHMxMzc0X3dkdF9waW5nKCk7Ci0JCS8qIGZhbGx0aHJv
dWdoICovCi0JY2FzZSBXRElPQ19HRVRUSU1FT1VUOgotCQkvKiB3aGVuIHJldHVybmluZyAuLi4g
aW52ZXJzZSBpcyB0cnVlICovCi0JCXJldHVybiBwdXRfdXNlcigod2R0X21hcmdpbiA+PiAxMiks
IChpbnQgX191c2VyICopYXJnKTsKLQljYXNlIFdESU9DX1NFVE9QVElPTlM6Ci0JCWlmIChjb3B5
X2Zyb21fdXNlcigmb3B0aW9ucywgKGludCBfX3VzZXIgKilhcmcsIHNpemVvZihpbnQpKSkKLQkJ
CXJldHVybiAtRUZBVUxUOwotCi0JCWlmIChvcHRpb25zICYgV0RJT1NfRElTQUJMRUNBUkQpIHsK
LQkJCXByX2luZm8oImRpc2FibGUgd2F0Y2hkb2dcbiIpOwotCQkJZHMxMzc0X3dkdF9kaXNhYmxl
KCk7Ci0JCQlyZXR1cm4gMDsKLQkJfQotCi0JCWlmIChvcHRpb25zICYgV0RJT1NfRU5BQkxFQ0FS
RCkgewotCQkJcHJfaW5mbygiZW5hYmxlIHdhdGNoZG9nXG4iKTsKLQkJCWRzMTM3NF93ZHRfc2V0
dGltZW91dCh3ZHRfbWFyZ2luKTsKLQkJCWRzMTM3NF93ZHRfcGluZygpOwotCQkJcmV0dXJuIDA7
Ci0JCX0KLQkJcmV0dXJuIC1FSU5WQUw7Ci0JfQotCXJldHVybiAtRU5PVFRZOwotfQotCi1zdGF0
aWMgbG9uZyBkczEzNzRfd2R0X3VubG9ja2VkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNp
Z25lZCBpbnQgY21kLAotCQkJdW5zaWduZWQgbG9uZyBhcmcpCi17Ci0JaW50IHJldDsKLQlzdHJ1
Y3QgZHMxMzc0ICpkczEzNzQgPSBpMmNfZ2V0X2NsaWVudGRhdGEoc2F2ZV9jbGllbnQpOwotCi0J
bXV0ZXhfbG9jaygmZHMxMzc0LT5tdXRleCk7Ci0JcmV0ID0gZHMxMzc0X3dkdF9pb2N0bChmaWxl
LCBjbWQsIGFyZyk7Ci0JbXV0ZXhfdW5sb2NrKCZkczEzNzQtPm11dGV4KTsKLQotCXJldHVybiBy
ZXQ7Ci19Ci0KLXN0YXRpYyBpbnQgZHMxMzc0X3dkdF9ub3RpZnlfc3lzKHN0cnVjdCBub3RpZmll
cl9ibG9jayAqdGhpcywKLQkJCXVuc2lnbmVkIGxvbmcgY29kZSwgdm9pZCAqdW51c2VkKQotewot
CWlmIChjb2RlID09IFNZU19ET1dOIHx8IGNvZGUgPT0gU1lTX0hBTFQpCi0JCS8qIERpc2FibGUg
V2F0Y2hkb2cgKi8KLQkJZHMxMzc0X3dkdF9kaXNhYmxlKCk7Ci0JcmV0dXJuIE5PVElGWV9ET05F
OwotfQotCi1zdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBkczEzNzRfd2R0X2Zv
cHMgPSB7Ci0JLm93bmVyCQkJPSBUSElTX01PRFVMRSwKLQkucmVhZAkJCT0gZHMxMzc0X3dkdF9y
ZWFkLAotCS51bmxvY2tlZF9pb2N0bAkJPSBkczEzNzRfd2R0X3VubG9ja2VkX2lvY3RsLAotCS5j
b21wYXRfaW9jdGwJCT0gY29tcGF0X3B0cl9pb2N0bCwKLQkud3JpdGUJCQk9IGRzMTM3NF93ZHRf
d3JpdGUsCi0JLm9wZW4gICAgICAgICAgICAgICAgICAgPSBkczEzNzRfd2R0X29wZW4sCi0JLnJl
bGVhc2UgICAgICAgICAgICAgICAgPSBkczEzNzRfd2R0X3JlbGVhc2UsCi0JLmxsc2VlawkJCT0g
bm9fbGxzZWVrLAotfTsKLQotc3RhdGljIHN0cnVjdCBtaXNjZGV2aWNlIGRzMTM3NF9taXNjZGV2
ID0gewotCS5taW5vciAgICAgICAgICA9IFdBVENIRE9HX01JTk9SLAotCS5uYW1lICAgICAgICAg
ICA9ICJ3YXRjaGRvZyIsCi0JLmZvcHMgICAgICAgICAgID0gJmRzMTM3NF93ZHRfZm9wcywKLX07
Ci0KLXN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgZHMxMzc0X3dkdF9ub3RpZmllciA9IHsK
LQkubm90aWZpZXJfY2FsbCA9IGRzMTM3NF93ZHRfbm90aWZ5X3N5cywKK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgd2F0Y2hkb2dfb3BzIGRzMTM3NF93ZHRfb3BzID0geworCS5vd25lciAgICAgICAgICA9
IFRISVNfTU9EVUxFLAorCS5zdGFydCAgICAgICAgICA9IGRzMTM3NF93ZHRfc3RhcnQsCisJLnN0
b3AgICAgICAgICAgID0gZHMxMzc0X3dkdF9zdG9wLAorCS5zZXRfdGltZW91dCAgICA9IGRzMTM3
NF93ZHRfc2V0dGltZW91dCwKIH07Ci0KLSNlbmRpZiAvKkNPTkZJR19SVENfRFJWX0RTMTM3NF9X
RFQqLworI2VuZGlmIC8qQ09ORklHX1dBVENIRE9HX0NPUkUqLwogLyoKICAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgogICoKQEAgLTY1MSwxNyArNTE0LDIzIEBAIHN0YXRpYyBpbnQgZHMxMzc0X3Byb2Jl
KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAot
I2lmZGVmIENPTkZJR19SVENfRFJWX0RTMTM3NF9XRFQKLQlzYXZlX2NsaWVudCA9IGNsaWVudDsK
LQlyZXQgPSBtaXNjX3JlZ2lzdGVyKCZkczEzNzRfbWlzY2Rldik7CisjaWZkZWYgQ09ORklHX1dB
VENIRE9HX0NPUkUKKwlkczEzNzQtPndkdC5pbmZvID0gJmRzMTM3NF93ZHRfaW5mbzsKKwlkczEz
NzQtPndkdC5vcHMgPSAmZHMxMzc0X3dkdF9vcHM7CisJZHMxMzc0LT53ZHQudGltZW91dCA9IFRJ
TUVSX01BUkdJTl9ERUZBVUxUOworCWRzMTM3NC0+d2R0Lm1pbl90aW1lb3V0ID0gVElNRVJfTUFS
R0lOX01JTjsKKwlkczEzNzQtPndkdC5tYXhfdGltZW91dCA9IFRJTUVSX01BUkdJTl9NQVg7CisK
Kwl3YXRjaGRvZ19pbml0X3RpbWVvdXQoJmRzMTM3NC0+d2R0LCB3ZHRfbWFyZ2luLCAmY2xpZW50
LT5kZXYpOworCXdhdGNoZG9nX3NldF9ub3dheW91dCgmZHMxMzc0LT53ZHQsIG5vd2F5b3V0KTsK
Kwl3YXRjaGRvZ19zdG9wX29uX3JlYm9vdCgmZHMxMzc0LT53ZHQpOworCXdhdGNoZG9nX3N0b3Bf
b25fdW5yZWdpc3RlcigmZHMxMzc0LT53ZHQpOworCXdhdGNoZG9nX3NldF9kcnZkYXRhKCZkczEz
NzQtPndkdCwgZHMxMzc0KTsKKwlkczEzNzRfd2R0X3NldHRpbWVvdXQoJmRzMTM3NC0+d2R0LCBk
czEzNzQtPndkdC50aW1lb3V0KTsKKworCXJldCA9IGRldm1fd2F0Y2hkb2dfcmVnaXN0ZXJfZGV2
aWNlKCZjbGllbnQtPmRldiwgJmRzMTM3NC0+d2R0KTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwotCXJldCA9IHJlZ2lzdGVyX3JlYm9vdF9ub3RpZmllcigmZHMxMzc0X3dkdF9ub3RpZmllcik7
Ci0JaWYgKHJldCkgewotCQltaXNjX2RlcmVnaXN0ZXIoJmRzMTM3NF9taXNjZGV2KTsKLQkJcmV0
dXJuIHJldDsKLQl9Ci0JZHMxMzc0X3dkdF9zZXR0aW1lb3V0KDEzMTA3Mik7CiAjZW5kaWYKIAog
CXJldHVybiAwOwpAQCAtNjcwLDExICs1MzksNiBAQCBzdGF0aWMgaW50IGRzMTM3NF9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogc3RhdGljIGludCBkczEzNzRfcmVtb3ZlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpCiB7CiAJc3RydWN0IGRzMTM3NCAqZHMxMzc0ID0gaTJjX2dl
dF9jbGllbnRkYXRhKGNsaWVudCk7Ci0jaWZkZWYgQ09ORklHX1JUQ19EUlZfRFMxMzc0X1dEVAot
CW1pc2NfZGVyZWdpc3RlcigmZHMxMzc0X21pc2NkZXYpOwotCWRzMTM3NF9taXNjZGV2LnBhcmVu
dCA9IE5VTEw7Ci0JdW5yZWdpc3Rlcl9yZWJvb3Rfbm90aWZpZXIoJmRzMTM3NF93ZHRfbm90aWZp
ZXIpOwotI2VuZGlmCiAKIAlpZiAoY2xpZW50LT5pcnEgPiAwKSB7CiAJCW11dGV4X2xvY2soJmRz
MTM3NC0+bXV0ZXgpOwotLSAKMi4yMC4xCg==
