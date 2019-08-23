Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D30579A619
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 05:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389784AbfHWDhq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 23:37:46 -0400
Received: from mga01.intel.com ([192.55.52.88]:49107 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732546AbfHWDhq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Aug 2019 23:37:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 20:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; 
   d="scan'208";a="378740655"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2019 20:37:45 -0700
Received: from [10.226.38.55] (rtanwar-mobl.gar.corp.intel.com [10.226.38.55])
        by linux.intel.com (Postfix) with ESMTP id 78D5D5803A5;
        Thu, 22 Aug 2019 20:37:41 -0700 (PDT)
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
 <25f6947d-7ba0-c23c-25aa-c4c4173da6b0@linux.intel.com>
 <20190822130429.GN30120@smile.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <a6717e97-01cf-771c-8467-be5946528dd0@linux.intel.com>
Date:   Fri, 23 Aug 2019 11:37:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190822130429.GN30120@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andy,

On 22/8/2019 9:04 PM, Andy Shevchenko wrote:
> On Thu, Aug 22, 2019 at 05:26:33PM +0800, Tanwar, Rahul wrote:
>> On 22/8/2019 5:02 PM, Andy Shevchenko wrote:
>>> On Thu, Aug 22, 2019 at 03:44:03PM +0800, Rahul Tanwar wrote:
>>>> Use a newly introduced optional "status" property of "motorola,mc146818"
>>>> compatible DT node to determine if RTC is supported. Skip read/write from
>>>> RTC device only when this node is present and status is "disabled". In all
>>>> other cases, proceed as before.
>>> Can't we rather update ->get_wallclock() and ->set_wallclock() based on this?
>>
>> get_wallclock() and set_wallclock() are function pointers of platform_ops
>>
>> which are initialized to mach_get_cmos_time() and mach_set_rtc_mmss()
>>
>> at init time. Since adding a new platform to override these functions is
>>
>> discouraged, so the only way is to modify RTC get/set functions.
> Shouldn't it be platform agnostic code?
> So, my point is, instead of hacking two functions, perhaps better to avoid them
> at all.

Sorry, i could not understand your point. The changes are platform

agnostic i.e. it doesn't break existing use cases. Are you recommending

to add a new platform and make changes there ?

Regards,

Rahul

>
>
