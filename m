Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319481BFCA4
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Apr 2020 16:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbgD3OHF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Apr 2020 10:07:05 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41977 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbgD3OHE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Apr 2020 10:07:04 -0400
Received: by mail-oi1-f193.google.com with SMTP id 19so5285305oiy.8;
        Thu, 30 Apr 2020 07:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ypl3TMqHlEyc54S03DtZTNB+eyp6v+vQ5hgOUzmHpUg=;
        b=SFkYlMRXJa1HQ07Vm9xq+/fUHRF/zrLe5DI+io2D0hUv09irfHHaC3/1RovhELkLl/
         7M/FtKN16USdyv/qXLMP3gFaobhgra6wepDNXH5YSwnn3Vayon2M0rX0KLs2GZ0vi754
         Kk9+waZK4mBk35uSo5yYfQWGn0zxsBUsjptk3KoHbsjxzS5k1QBok9S8tk/FkvAvqGjo
         o//Gv7RHgyqWLfaV+L71c17+USRbGnfwV7QJ1yHrspRHkEIrPQdqKWh+CJl4wTldTOFz
         oUjn1xw/5p/yS6r0cn8frVkNqxU9/9B/QjORlDM5RcqElLdX5w0tqbAnc3GxdLKBoeB3
         hPAg==
X-Gm-Message-State: AGi0PubHnws3Z0Lxpeu4bHQk2Nj8omKENfKHBug8zRvWa3g9ffiy7Bxt
        1Wh+jeMjG2BeVjWOFaqKUA==
X-Google-Smtp-Source: APiQypIP8LI9E0STiYnne0hBy5N7yLlgo3kcsx6yXCtmZ7uE9MOuR1kv9WPAh62YT3wAZ4XcJhqUuQ==
X-Received: by 2002:aca:1709:: with SMTP id j9mr1847601oii.59.1588255622600;
        Thu, 30 Apr 2020 07:07:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j42sm1327968ooi.5.2020.04.30.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:07:01 -0700 (PDT)
Received: (nullmailer pid 31546 invoked by uid 1000);
        Thu, 30 Apr 2020 14:07:01 -0000
Date:   Thu, 30 Apr 2020 09:07:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on
 MAX77620
Message-ID: <20200430140701.GA21776@bogus>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417170825.2551367-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Apr 17, 2020 at 07:08:23PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The RTC present on MAX77620 can be used to generate an alarm at a given
> time, which in turn can be used as a wakeup source for the system if it
> is properly wired up.
> 
> Document how to enable the RTC to act as a wakeup source.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/mfd/max77620.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> index 5a642a51d58e..f05005b0993e 100644
> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -125,6 +125,17 @@ MAX77663 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
>  			control) then, GPIO1/nRST_IO goes LOW.
>  			this property is valid for max20024 only.
>  
> +Realtime Clock
> +--------------
> +The MAX77620 family of power management ICs contain a realtime clock block
> +that can be used to keep track of time even when the system is powered off.
> +
> +The realtime clock can also be programmed to trigger alerts, which can be
> +used to wake the system up from sleep. In order to configure the RTC to act
> +as a wakeup source, add an "rtc" child node and add the "wakeup-source"
> +property.
> +
> +
>  For DT binding details of different sub modules like GPIO, pincontrol,
>  regulator, power, please refer respective device-tree binding document
>  under their respective sub-system directories.
> @@ -159,4 +170,8 @@ max77620@3c {
>  			maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_SW>;
>  		};
>  	};
> +
> +	rtc {
> +		wakeup-source;

Is the RTC really the only thing that could wake the system in this 
PMIC?

I don't think it's really valid to have 'wakeup-source' without 
'interrupts' unless the wakeup mechanism is somehow not an interrupt. So 
I think this belongs in the parent node.

Rob
