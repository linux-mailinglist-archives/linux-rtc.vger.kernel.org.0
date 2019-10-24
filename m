Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F26E3900
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2019 18:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409978AbfJXQ5f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Oct 2019 12:57:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:39980 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409957AbfJXQ5f (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 24 Oct 2019 12:57:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 09:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; 
   d="scan'208";a="201535381"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
  by orsmga003.jf.intel.com with ESMTP; 24 Oct 2019 09:57:29 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 24 Oct 2019 09:57:28 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.146]) by
 ORSMSX112.amr.corp.intel.com ([169.254.3.185]) with mapi id 14.03.0439.000;
 Thu, 24 Oct 2019 09:57:28 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "Yu, Fenghua" <fenghua.yu@intel.com>,
        "Stephane Eranian" <eranian@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
Thread-Topic: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
Thread-Index: AQHVibMQWvZIw22fo0GB+QhOFS8CkqdokOYAgACKZID//6LhUIAAlJQAgACJm4CAACeSIA==
Date:   Thu, 24 Oct 2019 16:57:28 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7F4AEDED@ORSMSX115.amr.corp.intel.com>
References: <20191023150311.844123-1-arnd@arndb.de>
 <20191023184616.GA17078@agluck-desk2.amr.corp.intel.com>
 <20191023200135.GT3125@piout.net>
 <3908561D78D1C84285E8C5FCA982C28F7F4AD7F7@ORSMSX115.amr.corp.intel.com>
 <20191023232004.GV3125@piout.net>
 <CAK8P3a2=9dw2YN-sc7yxwwnRi-6Bos32==523qPaqW=avLs60Q@mail.gmail.com>
In-Reply-To: <CAK8P3a2=9dw2YN-sc7yxwwnRi-6Bos32==523qPaqW=avLs60Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGE3NjIzMzMtOGYyYi00YWQ0LTgwMjAtOTVjMWFjNzc5ZGNjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiM1ZGVW1WbGpBZmlBWjd0eHZGU1FQK3R2OEtJSnVOUDRSSEdWQks4cnYySWdaa04yMnJndXRiUTlQN3dabUpFciJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBhcmNoL2lhNjQgaGFzIGEgcmVhZF9wZXJzaXN0ZW50X2Nsb2NrNjQoKSBmdW5jdGlvbiwgc28g
aXQgZW5kcyB1cCByZWFkaW5nDQo+IHRoZSBzeXN0ZW0gdGltZSByZWdhcmRsZXNzIG9mIHRoZSBS
VEMgZHJpdmVyIG9yIENPTkZJR19SVENfSENUT1NZUy4NCj4NCj4gQXMgaWE2NCBzZXRzIG5laXRo
ZXIgQVJDSF9ISUJFUk5BVElPTl9QT1NTSUJMRSBub3INCj4gQVJDSF9TVVNQRU5EX1BPU1NJQkxF
LCBzbyB3ZSBjb3VsZCBqdXN0IHJlbW92ZSB0aGUNCj4gcmVhZF9wZXJzaXN0ZW50X2Nsb2NrNjQo
KSBhbmQgZWZpX2dldHRpbWVvZmRheSgpLCByZWx5aW5nIGluc3RlYWQNCj4gb24gdXNlciBzcGFj
ZSAoL3NiaW4vaHdjbG9jaykgb3IgQ09ORklHX1JUQ19IQ1RPU1lTLg0KDQpTZWVtcyB3ZWlyZC4g
aWE2NCBoYXMgYWx3YXlzIGFzc3VtZWQgZnJvbSBkYXkgMSB0aGF0IGl0IGlzIHJ1bm5pbmcNCm9u
IGEgVUVGSSBjYXBhYmxlIHBsYXRvcm0gKHdlbGwgYXQgZGF5IDEgaXQgd2FzIGNhbGxlZCAiRUZJ
IiwgdGhlICJVIg0KY2FtZSBsYXRlcikuDQoNClNvIHJlYWRfcGVyc2lzdGVudF9jbG9jazY0KCkg
anVzdCBjYWxscyBFRkkgZGlyZWN0bHkgdG8gZ2V0IHRoZSB0aW1lLg0KDQpTZWVtcyBzaW1wbGVy
IHRoYW4gd29ycnlpbmcgYWJvdXQgaGF2aW5nIHRoZSByaWdodCBkcml2ZXJzIGFuZCBDT05GSUcN
CmJpdHMgc2V0Lg0KDQotVG9ueQ0K
