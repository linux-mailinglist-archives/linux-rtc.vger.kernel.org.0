Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B83D98FB8
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 11:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731132AbfHVJio (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 05:38:44 -0400
Received: from mga12.intel.com ([192.55.52.136]:64781 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730897AbfHVJio (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Aug 2019 05:38:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 02:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="173071325"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2019 02:38:43 -0700
Received: from [10.226.38.83] (rtanwar-mobl.gar.corp.intel.com [10.226.38.83])
        by linux.intel.com (Postfix) with ESMTP id B783958047A;
        Thu, 22 Aug 2019 02:38:39 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] dt-bindings: rtc: Add optional status property
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        alan@linux.intel.com, linux-kernel@vger.kernel.org,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com,
        rahul.tanwar@intel.com
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
 <1b01287241d49638c43222d32f3ece5a38c95ddf.1566458029.git.rahul.tanwar@linux.intel.com>
 <20190822085659.GI30120@smile.fi.intel.com>
 <20190822090948.GQ27031@piout.net>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <5b90de84-5531-b8f3-65a7-0009c4a4f8f1@linux.intel.com>
Date:   Thu, 22 Aug 2019 17:38:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190822090948.GQ27031@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 22/8/2019 5:09 PM, Alexandre Belloni wrote:
> On 22/08/2019 11:56:59+0300, Andy Shevchenko wrote:
>> On Thu, Aug 22, 2019 at 03:44:04PM +0800, Rahul Tanwar wrote:
>>> Some products may not support MC146818 RTC CMOS device. Introduce a optional
>>> 'status' standard property for RTC-CMOS to indicate if the MC146818 RTC device
>>> is available (status="okay") or not (status="disabled")
>> This needs to be converted to YAML
>>
> Well, I think the status property doesn't even need to be documented
> because it is simply the generic behaviour.

Thanks for your comments. I now realize it. I will omit posting this again.


Regards,

Rahul


