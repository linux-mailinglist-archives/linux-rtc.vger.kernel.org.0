Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC41744C38A
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 16:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhKJPDz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 10:03:55 -0500
Received: from smtp2.axis.com ([195.60.68.18]:43056 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232298AbhKJPDz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 10 Nov 2021 10:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636556467;
  x=1668092467;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=w0+riHq93iG+CQH80ytBE3AjjZfp5T1CrQE9fCr8XTs=;
  b=HUYGn81jjrygZQGjDMiE98shA8Qm+RVjaS5G3bDXLRo6d80tZoNVVX/b
   XN7m4lqMDYSR+CH4fVCkJMj5PvoBCy9jaKhgRDL0ZFlbT+lqaow4qGleC
   kgQfOlC1dj/LOz95CoOQHq3Tx+/a6VCRiZ6VZuP/qJmIFgvuSGvLIFYg3
   KPUhvzrJxqhQPN/3jjd3kZ8rlFeRqMNkVYTh8Tz+ndAlJh9G+I4IzQ1Ml
   i/b/CVfMEpM38dkfTq6I/REhewhmrjcm7jCd8pcrNgxKu83fWPWlLeU2k
   K9itcMMbYnz3hrYPSY1iZbQHcpIwHolYuE8DPoPsvhKUc1AfFbkHeNYO0
   Q==;
Subject: Re: [PATCH] rtc: rs5c372: Add RTC_VL_READ, RTC_VL_CLR ioctls
To:     Camel Guo <Camel.Guo@axis.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>, kernel <kernel@axis.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211110115455.18699-1-camel.guo@axis.com>
 <YYvPCehWWVE5mKTy@piout.net> <2303e635-dbd0-1730-cc6f-84021eb37223@axis.com>
 <YYvW3T3wM/Qn5jSw@piout.net> <fa032379-2ca6-f5ca-0e84-91ae13a19488@axis.com>
From:   Camel Guo <camelg@axis.com>
Message-ID: <44db2451-852e-7f93-5d61-535e9decfefd@axis.com>
Date:   Wed, 10 Nov 2021 16:01:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fa032379-2ca6-f5ca-0e84-91ae13a19488@axis.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail06w.axis.com (10.20.40.12) To se-mail03w.axis.com
 (10.20.40.9)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Patch V2 has been uploaded. Please review patch v2 instead.

On 11/10/21 3:30 PM, Camel Guo wrote:
> Hello,
> 
> On 11/10/21 3:27 PM, Alexandre Belloni wrote:
>> On 10/11/2021 15:03:49+0100, Camel Guo wrote:
>>> > On 10/11/2021 12:54:54+0100, Camel Guo wrote:
>>> > > From: Camel Guo <camelg@axis.com>
>>> > > +     switch (cmd) {
>>> > > +     case RTC_VL_READ:
>>> > > +             flags = 0;
>>> > > +
>>> > > +             switch (rs5c->type) {
>>> > > +             case rtc_r2025sd:
>>> > > +             case rtc_r2221tl:
>>> > > +                     if ((rs5c->type == rtc_r2025sd && !(ctrl2 & R2x2x_CTRL2_XSTP)) ||
>>> > > +                             (rs5c->type == rtc_r2221tl &&  (ctrl2 & R2x2x_CTRL2_XSTP))) {
>>> > > +                             flags |= RTC_VL_DATA_INVALID;
>>> > > +                     }
>>> > > +                     if (ctrl2 & R2x2x_CTRL2_VDET)
>>> > > +                             flags |= RTC_VL_ACCURACY_LOW;
>>> > 
>>> > Shouldn't that be RTC_VL_BACKUP_LOW?
>>> 
>>> Some drivers (e.g: rv3029_ioctl and rv8803_ioctl) use RTC_VL_ACCURACY_LOW,
>>> but some other drivers (e.g: abx80x_ioctl, pcf2127_rtc_ioctl and
>>> pcf8523_rtc_ioctl) use RTC_VL_BACKUP_LOW instead. Is there any guideline or
>>> document telling the differences between them?
>>> 
>> 
>> RTC_VL_BACKUP_LOW: The backup voltage is low
>> RTC_VL_ACCURACY_LOW: the primary or backup voltage is low, temperature
>> compensation (or similar) has stopped
> 
> Then I agree that we should go for RTC_VL_BACKUP_LOW.
> 
>> 
>> -- 
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
