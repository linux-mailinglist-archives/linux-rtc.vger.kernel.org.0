Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42B05A6577
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2019 11:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbfICJhF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Sep 2019 05:37:05 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:35200 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbfICJhF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Sep 2019 05:37:05 -0400
Received: by mail-wm1-f42.google.com with SMTP id n10so6707806wmj.0
        for <linux-rtc@vger.kernel.org>; Tue, 03 Sep 2019 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qI/msxsXqWRFdL3aN3sjsVskSGThrgClxOqJ+yrbiFg=;
        b=IClJ3jwzE0/tSlHhR/nSMgACWjFl7gf80AbtmZBxCUHLt/Jcojva+3rM9j+rrDNmZ6
         LnL2oaZMOHls872SeyCum8/euj+LPM3aKsfWkOJYmKQMLEeAbBu1wVvhImNp0G92PVyC
         la/HV8FTjwVgupmRNGrmxzC25ZN+cYXk4vKmetNrGxzVjnnxYvzxh5zAd87UNXEDEVTs
         8aXDBns9TE/og3A1VyIrvgzraaj0SVG9v2nSlkh7w3QOM9m27GCuQ1GtLWs5hBbh0a6e
         aTn4P54W6Bk4f2g1l0ZAyg3Orv7gPfEhYiBnkNJCdjkDn8uijF6ha1eEWe9LytiiyFfe
         ntjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qI/msxsXqWRFdL3aN3sjsVskSGThrgClxOqJ+yrbiFg=;
        b=a5M2U1N06BncWZ5GGWX8c/60GZS/QcY5uwLTwibiB/MoGSsJW1mw1yf/R5SEMoP4Sm
         JnYnEaqsXBa6L/s3ngrvazZwDlqecavRVYH2MRh35GbNyt2Fe5HyjBgu4t10jid9j+a1
         9fFGUtVJAq1x4CzfQQ7aPp/mswvtbwkhU9NHMkjbYRmNdfaAVOkF60NxNfvPdzrgBMum
         dqVwJlofORerPvVLsDU6iJKGnlGyi0/+p6sgnpk1MXrkjylfpc6DbzcZh3XWnP+VMrTQ
         5U056HnHg5Bei1s7b5ljsocD+8NQwwDCYG96s/IPtrmD4ixLVlyWelypMFXaQFwCbNyB
         9jRQ==
X-Gm-Message-State: APjAAAWxzJKylvZJQqYtroOOqxIhx8IXXpdfhifr9PWq9ah8gl6xtJa4
        can10wkkUNEvYB7nMY5xqn85Tw==
X-Google-Smtp-Source: APXvYqwKeqWbkYsTbb1bHmCDBrDdZ4xi2S+xJY3fjb1VnljLf2QDsUv581Cs/3vKfnrmdnIVUqLZUg==
X-Received: by 2002:a1c:658a:: with SMTP id z132mr42363159wmb.98.1567503422825;
        Tue, 03 Sep 2019 02:37:02 -0700 (PDT)
Received: from [10.32.50.252] ([185.149.63.251])
        by smtp.gmail.com with ESMTPSA id v11sm29740643wrv.54.2019.09.03.02.37.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 02:37:02 -0700 (PDT)
Subject: Re: [v3,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
To:     Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        mark.rutland@arm.com, leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Martin Fuzzey <mfuzzey@parkeon.com>
References: <20190903061853.19793-1-biwen.li@nxp.com>
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
Message-ID: <2374870a-a728-b046-9ec6-bd7773411f50@flowbird.group>
Date:   Tue, 3 Sep 2019 11:37:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190903061853.19793-1-biwen.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/09/2019 08:18, Biwen Li wrote:
> diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> index 94adc1cf93d9..588f688b30d1 100644
> --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> @@ -8,10 +8,39 @@ Required properties:
>   Optional properties:
>   - interrupts: IRQ line for the RTC (not implemented).
>   
> +- interrupt-output-pin: The interrupt output pin must be
> +  "INTA" or "INTB", default value is "INTA"
> +


The hardware has 2 interrupt pins which can be mapped to various 
interrupt sources (alarm1, alarm2, periodic, ...)

Currently the driver only supports alarm1.

It is even possible to use both pins for the same interrupt (eg if INTA 
were wired to the SoC, INTB to a PMIC and both used for alarm...)


So maybe it would be better to have

alarm1-interrupt-output-pin: The interrupt output pin used for the alarm 
function. Must be "INTA", "INTB" or "BOTH"

Then, if and when other types of interrupts are supported by the driver 
new properties could be added for them.



> +- quartz-load-femtofarads: The internal capacitor to select for the quartz:
> +	PCF85263_QUARTZCAP_7pF		[0]
> +	PCF85263_QUARTZCAP_6pF		[1]
> +	PCF85263_QUARTZCAP_12p5pF	[2] DEFAULT
> +


The standard DT property "quartz-load-femtofarads" takes the real 
physical value in femto Farads ie values should be 7000, 6000, 12500 
without defines.


> +- nxp,quartz-drive-strength: Drive strength for the quartz:
> +	PCF85263_QUARTZDRIVE_100ko	[0] DEFAULT
> +	PCF85263_QUARTZDRIVE_60ko	[1]
> +	PCF85263_QUARTZDRIVE_500ko	[2]
> +


Not sure about this.

Wouldn't it be better to either use a real impedence value in ohms (like 
load property above, even though it is a vendor specific value) rather 
than a define, or defines for "Low, Medium, High"?


Martin


