Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B990E255B
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2019 23:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391221AbfJWVab convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 23 Oct 2019 17:30:31 -0400
Received: from mga11.intel.com ([192.55.52.93]:38575 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732284AbfJWVab (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 23 Oct 2019 17:30:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 14:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; 
   d="scan'208";a="398194410"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2019 14:30:31 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 23 Oct 2019 14:30:30 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.146]) by
 ORSMSX151.amr.corp.intel.com ([169.254.7.36]) with mapi id 14.03.0439.000;
 Wed, 23 Oct 2019 14:30:30 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "Yu, Fenghua" <fenghua.yu@intel.com>,
        Stephane Eranian <eranian@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
Thread-Topic: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
Thread-Index: AQHVibMQWvZIw22fo0GB+QhOFS8CkqdokOYAgACKZID//6LhUA==
Date:   Wed, 23 Oct 2019 21:30:29 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7F4AD7F7@ORSMSX115.amr.corp.intel.com>
References: <20191023150311.844123-1-arnd@arndb.de>
 <20191023184616.GA17078@agluck-desk2.amr.corp.intel.com>
 <20191023200135.GT3125@piout.net>
In-Reply-To: <20191023200135.GT3125@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjA3N2Y2M2EtNzg5Yi00NjIwLTg2N2EtZDE0YjM1ZDYyMDRiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTnhPZ2Y3ZUV0MGdpMVZtMk5rcm92U01IaW8rYVpBSGYya0RydDNhb3ptaWhuZEJDQUx4MDdCbTF4Mk9nbUZKZSJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>> rtc-efi rtc-efi: setting system clock to 2019-10-23T18:30:23 UTC (1571855423)

> You can remove CONFIG_RTC_HCTOSYS, this line will disappear, systemd
> will not like that but efirtc was not setting the system time anyway so
> this shouldn't change the behaviour.


Wait ... that message says "setting system clock"

but then you say " efirtc was not setting the system time anyway".

So did the time get set, or not?

If it wasn't set, why does the message say that it was set?

-Tony
