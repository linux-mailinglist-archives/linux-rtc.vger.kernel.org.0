Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D81098F42
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 11:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731865AbfHVJ0m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 05:26:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:22515 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731829AbfHVJ0m (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Aug 2019 05:26:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 02:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="262790259"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 22 Aug 2019 02:26:41 -0700
Received: from [10.226.38.83] (rtanwar-mobl.gar.corp.intel.com [10.226.38.83])
        by linux.intel.com (Postfix) with ESMTP id CE8235806C4;
        Thu, 22 Aug 2019 02:26:37 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] x86/rtc: Add option to skip using RTC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, alan@linux.intel.com,
        linux-kernel@vger.kernel.org, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com, rahul.tanwar@intel.com
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
 <becacc523508b295a52db9f1592e2868e3988e28.1566458029.git.rahul.tanwar@linux.intel.com>
 <20190822090208.GJ30120@smile.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <25f6947d-7ba0-c23c-25aa-c4c4173da6b0@linux.intel.com>
Date:   Thu, 22 Aug 2019 17:26:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190822090208.GJ30120@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


Hi Andy,

On 22/8/2019 5:02 PM, Andy Shevchenko wrote:
> On Thu, Aug 22, 2019 at 03:44:03PM +0800, Rahul Tanwar wrote:
>> Use a newly introduced optional "status" property of "motorola,mc146818"
>> compatible DT node to determine if RTC is supported. Skip read/write from
>> RTC device only when this node is present and status is "disabled". In all
>> other cases, proceed as before.
> Can't we rather update ->get_wallclock() and ->set_wallclock() based on this?


get_wallclock() and set_wallclock() are function pointers of platform_ops

which are initialized to mach_get_cmos_time() and mach_set_rtc_mmss()

at init time. Since adding a new platform to override these functions is

discouraged, so the only way is to modify RTC get/set functions.


Regards,

Rahul

