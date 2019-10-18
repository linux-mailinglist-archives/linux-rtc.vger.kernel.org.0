Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48FBEDC1FF
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2019 12:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403993AbfJRKCc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Oct 2019 06:02:32 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:36166 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389081AbfJRKCc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 18 Oct 2019 06:02:32 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46vhR964WNz1rbLw;
        Fri, 18 Oct 2019 12:02:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46vhR95GxNz1qqkJ;
        Fri, 18 Oct 2019 12:02:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id SGdtoCozUb-6; Fri, 18 Oct 2019 12:02:28 +0200 (CEST)
X-Auth-Info: Hlu3gswWWogMyRCvlWNhIPirpcHi4k5BQihMZtIGVVI=
Received: from antares.denx.de (unknown [62.91.23.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 18 Oct 2019 12:02:28 +0200 (CEST)
Cc:     pn@denx.de, a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, parthitce@gmail.com
Subject: Re: [PATCH] rtc: rv3028: add clkout support
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20190927141505.640751-1-pn@denx.de>
 <20191011091738.GC3125@piout.net>
From:   Parthiban Nallathambi <pn@denx.de>
Message-ID: <942df087-0f61-f573-77a0-7b27582e25c8@denx.de>
Date:   Fri, 18 Oct 2019 12:02:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011091738.GC3125@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Thanks for the comments. Will send v2 with changes.

On 10/11/19 11:17 AM, Alexandre Belloni wrote:
> Hi,
> 
> thanks for the patch, minor comments below.
> 
> On 27/09/2019 16:15:05+0200, Parthiban Nallathambi wrote:
>> +	ret = regmap_update_bits(rv3028->regmap, RV3028_STATUS,
>> +				 RV3028_STATUS_CLKF, 0);
>> +	if (ret < 0)
>> +		return ret;
>> +
> 
> This is already done earlier and this will not be enabled again unless
> CLKIE is set which should not happen. So I don't think it is necessary
> to do it once again here.

Agree, removed in v2.

> 
>> +	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++) {
>> +		if (clkout_rates[i] == rate) {
>> +			ret = regmap_update_bits(rv3028->regmap,
>> +						 RV3028_CLKOUT,
>> +						 RV3028_CLKOUT_FD_MASK, i);
>> +			if (ret < 0)
>> +				return ret;
>> +
>> +			return regmap_write(rv3028->regmap, RV3028_CLKOUT,
>> +				RV3028_CLKOUT_CLKSY | RV3028_CLKOUT_CLKOE);
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
> 
> 
>> +static int rv3028_clkout_register_clk(struct rv3028_data *rv3028,
>> +				      struct i2c_client *client)
>> +{
>> +	int ret;
>> +	struct clk *clk;
>> +	struct clk_init_data init;
>> +	struct device_node *node = client->dev.of_node;
>> +
>> +	/* disable the clkout output */
>> +	ret = regmap_write(rv3028->regmap, RV3028_CLKOUT, 0x0);
>> +	if (ret < 0)
>> +		return ret;
>> +
> 
> This is not what the user would expect and could introduce a glitch in
> the clock output every time the platform is booted. If there are no
> users of the clock, then you should probably let the core disable it
> once the boot has ended.

Thanks, removed in v2.

> 
> 

-- 
Thanks,
Parthiban N

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: pn@denx.de
