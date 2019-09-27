Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C977C094D
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Sep 2019 18:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfI0QNc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Sep 2019 12:13:32 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45326 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfI0QNc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Sep 2019 12:13:32 -0400
Received: by mail-oi1-f193.google.com with SMTP id o205so5624732oib.12;
        Fri, 27 Sep 2019 09:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R0kFwxjKhbKX7zTefNj1C9kL38Pdttr44VLkkd4aR6M=;
        b=IZpCYSWlF+BoeMTK/82g/bQvxkT1+8ZiggCwYMFZ50/QWwsyrgPY8MODo5VGNBGuPG
         rangAF24vxBp4Go2zNCo2AA92Qu75ZFzkVBzzlHm8JHyQa2JWrUyXde2FwraoZph2aQo
         rfIAMVJjfuvPLBHmzuxScGfjdrAYdU1QeMyidWjI0/YuuVxmpgqKinZTsCGoOHsEr/69
         2djhBm+F1jP09QmkMa150C1J5o0rTwUmQrYTcFdwogMgdrKQLU7l/v5Gynme8K04PipY
         zB2rBEgmOIOhtSw9qoaDmgopRvC/2VSL8YWSLmnUl5BZYxdfDdjSr6K3TCK4cjnh14gL
         aSnw==
X-Gm-Message-State: APjAAAWBw88ep7ZOpxPcmYyDf6gdqC9fmr7cCFER24etOaJ4edwFLqHl
        loeWZ+mf65gOzDrKwOwGojhI7DA=
X-Google-Smtp-Source: APXvYqxiXG4nUbngZE7HV8pQpIyNW2FpjPrxNR4WhkRALYxubiNWTduYFFSLqHtfuti/TCRrBze2Ag==
X-Received: by 2002:aca:ebd1:: with SMTP id j200mr7380934oih.111.1569600811153;
        Fri, 27 Sep 2019 09:13:31 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w13sm1689397oih.54.2019.09.27.09.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 09:13:30 -0700 (PDT)
Date:   Fri, 27 Sep 2019 11:13:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: Re: [v5,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Message-ID: <20190927161330.GA22996@bogus>
References: <20190919014520.15500-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919014520.15500-1-biwen.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 19 Sep 2019 09:45:19 +0800, Biwen Li wrote:
> Add some properties for pcf85263/pcf85363 as follows:
>   - nxp,rtc-interrupt-type: integer type
>   - nxp,rtc-interrupt-output-pin: string type
>   - quartz-load-femtofarads: integer type
>   - quartz-drive-strength-ohms: integer type
>   - nxp,quartz-low-jitter: bool type
>   - wakeup-source: bool type
> 
> Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
> 	- Replace nxp,quartz-drive-strength with
> 	  quartz-drive-strength-ohms
> 	- Select ohm unit for quartz drive strength
> 
> Change in v4:
> 	- Drop robust defines in include/dt-bindings/rtc/pcf85363.h
> 	- Add nxp,rtc-interrupt-type property
> 	- Replace interrupt-output-pin with nxp,rtc-interrupt-output-pin
> 
> Change in v3:
> 	- None
> 
> Change in v2:
> 	- Replace properties name
> 	  quartz-load-capacitance -> quartz-load-femtofarads
> 	  quartz-drive-strength -> nxp,quartz-drive-strength
> 	  quartz-low-jitter -> nxp,quartz-low-jitter
> 	- Replace drive strength name
> 	  PCF85263_QUARTZDRIVE_NORMAL -> PCF85263_QUARTZDRIVE_100ko
> 	  PCF85263_QUARTZDRIVE_LOW -> PCF85263_QUARTZDRIVE_60ko
> 	  PCF85263_QUARTZDRIVE_HIGH -> PCF85263_QUARTZDRIVE_500ko
> 	- Set default interrupt-output-pin as "INTA"
> 
>  .../devicetree/bindings/rtc/pcf85363.txt      | 44 ++++++++++++++++++-
>  include/dt-bindings/rtc/pcf85363.h            | 14 ++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/rtc/pcf85363.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
