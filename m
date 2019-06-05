Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1638936323
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2019 20:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfFESKo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 Jun 2019 14:10:44 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:35778 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfFESKo (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 5 Jun 2019 14:10:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80482374;
        Wed,  5 Jun 2019 11:10:43 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9984F3F5AF;
        Wed,  5 Jun 2019 11:10:37 -0700 (PDT)
Subject: Re: [PATCH 10/13] drivers: Introduce variants of class_find_device()
To:     gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, rafael@kernel.org,
        a.zummo@towertech.it, alex.aring@gmail.com,
        alexander.shishkin@linux.intel.com, alexandre.belloni@bootlin.com,
        andrew@lunn.ch, arnd@arndb.de, dmurphy@ti.com, davem@davemloft.net,
        f.fainelli@gmail.com, freude@linux.ibm.com,
        heikki.krogerus@linux.intel.com, heiko.carstens@de.ibm.com,
        hkallweit1@gmail.com, jacek.anaszewski@gmail.com, jslaby@suse.com,
        lgirdwood@gmail.com, linux-leds@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wpan@vger.kernel.org, broonie@kernel.org,
        mcoquelin.stm32@gmail.com, pavel@ucw.cz, peda@axentia.se,
        stefan@datenfreihafen.org, tomas.winkler@intel.com,
        rafael.j.wysocki@intel.com
References: <1559747630-28065-1-git-send-email-suzuki.poulose@arm.com>
 <1559747630-28065-11-git-send-email-suzuki.poulose@arm.com>
 <20190605161439.GB17272@kroah.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <24e8617f-2e15-bb6c-a6bb-bc9e6b32aa56@arm.com>
Date:   Wed, 5 Jun 2019 19:13:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20190605161439.GB17272@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Greg,

On 06/05/2019 05:14 PM, Greg KH wrote:
> On Wed, Jun 05, 2019 at 04:13:47PM +0100, Suzuki K Poulose wrote:
>> +/**
>> + * class_find_device_by_devt : device iterator for locating a particular device
>> + * matching the device type.
>> + * @class: class type
>> + * @start: device to start search from
>> + * @devt: device type of the device to match.
>> + */
>> +static inline struct device *class_find_device_by_devt(struct class *class,
>> +						       struct device *start,
>> +						       dev_t devt)
>> +{
>> +	return class_find_device(class, start, &devt, device_match_devt);
>> +}
> 
> Still has the start parameter, despite the changelog saying it would not
> :(
> 

Well, I kept the start parameter just for the _devt variants, as
mentioned in the changelog:

" The new wrappers except the lookup by devt, drops the "start" device 
pointer as none of the existing users need it and the attributes are 
usually unique. The idea is to stop the proliferation of custom match.."

Somehow I thought the dev_t may be duplicate for devices, which is why
I didn't change that alone. But that was silly of me to ignore the minor
number part. I will respin it fixing that.

Suzuki
