Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1B2A71C3
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2019 19:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729751AbfICRgI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Sep 2019 13:36:08 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35393 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfICRgI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Sep 2019 13:36:08 -0400
Received: by mail-wr1-f65.google.com with SMTP id g7so18432567wrx.2;
        Tue, 03 Sep 2019 10:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JfMrJYtJUPzLOZJlIxda1cxv7oUuL2l1baMXS7bbp0s=;
        b=RHj2pNdQbx1WkjJfXBBMSiIU7lBD2PcpWLVmOvlhshBYiu/90b2gYlh1aznI/gAPD3
         28wvUWiXs87R276jWzckTXvPzVh81CFP/bsKomIHwLPAh0P69HNAVhcEwtpZ49bSpYNx
         yQ9sCmpa624Na7B/HHmSQB0vmwtbpkjkZez3IA+Ql7dHCtHxFOHVzSymaHvV4j+/sE/2
         eMEF7N9USHkvm5Jekwz4TTcvopZuicuZA51ZjI59IG9Y1A31ApBaKW4qsAin/Sr3pGs+
         bpxzhrC1DyTdZcIptvOTRICbHBQudJN1PeovjrXRk04f70rmovch7xyHkf51wqcJNMM7
         0QlA==
X-Gm-Message-State: APjAAAUFNwUJs8Z7X/TKonku3YiUXfx89Io3Tl96KP/CG046L0rCpl7i
        xxnh1ULPYravh3boHSPrgg==
X-Google-Smtp-Source: APXvYqwjsnz+S9lBtDPoXYyxD6MTfdCRaRTuPMoDchk0+PjdoP/supGH8bYqjJm7RmtdOvcdQUXcwg==
X-Received: by 2002:adf:dec8:: with SMTP id i8mr12957792wrn.286.1567532166433;
        Tue, 03 Sep 2019 10:36:06 -0700 (PDT)
Received: from localhost ([176.12.107.132])
        by smtp.gmail.com with ESMTPSA id g26sm334411wmh.32.2019.09.03.10.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 10:36:05 -0700 (PDT)
Date:   Tue, 3 Sep 2019 18:36:04 +0100
From:   Rob Herring <robh@kernel.org>
To:     Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, mark.rutland@arm.com,
        leoyang.li@nxp.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: Re: [v3,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Message-ID: <20190903173604.GA18177@bogus>
References: <20190903061853.19793-1-biwen.li@nxp.com>
 <2374870a-a728-b046-9ec6-bd7773411f50@flowbird.group>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2374870a-a728-b046-9ec6-bd7773411f50@flowbird.group>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Sep 03, 2019 at 11:37:01AM +0200, Martin Fuzzey wrote:
> On 03/09/2019 08:18, Biwen Li wrote:
> > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > index 94adc1cf93d9..588f688b30d1 100644
> > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > @@ -8,10 +8,39 @@ Required properties:
> >   Optional properties:
> >   - interrupts: IRQ line for the RTC (not implemented).
> > +- interrupt-output-pin: The interrupt output pin must be
> > +  "INTA" or "INTB", default value is "INTA"
> > +
> 
> 
> The hardware has 2 interrupt pins which can be mapped to various interrupt
> sources (alarm1, alarm2, periodic, ...)
> 
> Currently the driver only supports alarm1.
> 
> It is even possible to use both pins for the same interrupt (eg if INTA were
> wired to the SoC, INTB to a PMIC and both used for alarm...)
> 
> 
> So maybe it would be better to have
> 
> alarm1-interrupt-output-pin: The interrupt output pin used for the alarm
> function. Must be "INTA", "INTB" or "BOTH"

That's a property per source. 2 properties possible sources (either a 
mask or list) would be my preference.

Also, whatever you end up with needs a vendor prefix.

> 
> Then, if and when other types of interrupts are supported by the driver new
> properties could be added for them.
> 
> 
> 
> > +- quartz-load-femtofarads: The internal capacitor to select for the quartz:
> > +	PCF85263_QUARTZCAP_7pF		[0]
> > +	PCF85263_QUARTZCAP_6pF		[1]
> > +	PCF85263_QUARTZCAP_12p5pF	[2] DEFAULT
> > +
> 
> 
> The standard DT property "quartz-load-femtofarads" takes the real physical
> value in femto Farads ie values should be 7000, 6000, 12500 without defines.

I believe I said this on the last version.

> 
> 
> > +- nxp,quartz-drive-strength: Drive strength for the quartz:
> > +	PCF85263_QUARTZDRIVE_100ko	[0] DEFAULT
> > +	PCF85263_QUARTZDRIVE_60ko	[1]
> > +	PCF85263_QUARTZDRIVE_500ko	[2]
> > +
> 
> 
> Not sure about this.
> 
> Wouldn't it be better to either use a real impedence value in ohms (like
> load property above, even though it is a vendor specific value) rather than
> a define, or defines for "Low, Medium, High"?
> 
> 
> Martin
> 
> 
