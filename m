Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDDE65996D
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Dec 2022 15:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234982AbiL3OpA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 30 Dec 2022 09:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234743AbiL3Oo6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 30 Dec 2022 09:44:58 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660E3193DB;
        Fri, 30 Dec 2022 06:44:57 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 418D8100002;
        Fri, 30 Dec 2022 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1672411496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dAVafXIrgH3DH1GW8qt3K/eKjzRQTHeoc+yUmzH+sBU=;
        b=IXgBiOYSLNpvHxY2Xy7HZ+BuNIt617n2k93ltVqZ9amm/eG7wFAYhd8xMAVKFNzbozgkw2
        dVfJGEMvuMlaTatKhqC6HwjmD5frbJQYCKkeKkQ+UyDlle3tnJ4DD4Ia8D4U/G1jWLALu5
        uGfTplqSHq/vqWLH/096cg6H9LWGYrkkxRSjdELxeNFLNyH3AQZ5VbMdwFCgL1mgmXsBu6
        w7SuXJEDdqkmWi/ltcLiMaM9g41hbwT8CrIgWiJ3hDdBcwdXaF/c6VQ+23CWiNRE11o8eh
        tJuY40rY3DhOEmLUWOpvenIBSv3BpWs7FKpNjMtl91bXKJ/gjSpD1+fe1NQXBw==
Date:   Fri, 30 Dec 2022 15:44:54 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wadim Egorov <W.Egorov@phytec.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>
Subject: Re: [PATCH] dt-bindings: rtc: Add rv3028 to rv3032.yaml dtschema
Message-ID: <Y675ZsZsbQIga6fG@mail.local>
References: <20221228140610.938686-1-w.egorov@phytec.de>
 <19f62c10-de9f-88ee-70c3-279efbbcef0b@linaro.org>
 <08d74257-5f8b-31ae-8077-2c73c1430c0a@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08d74257-5f8b-31ae-8077-2c73c1430c0a@phytec.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/12/2022 11:09:32+0000, Wadim Egorov wrote:
> Am 28.12.22 um 15:15 schrieb Krzysztof Kozlowski:
> > Your subject is a bit incorrect. You do not add rv3028 to rv3032.yaml.
> > Also drop redundant "dtschema". Instead "Extend rv3028 bindings"
> >
> >
> > On 28/12/2022 15:06, Wadim Egorov wrote:
> >> Move RV3028 RTC bindings from trivial-rtc.yaml into microcrystal,rv3032.yaml.
> >> RV3028 can have a trickle-resitor-ohms property. Make it known to dtschema.
> > I don't understand what is here made known to dtschema, so maybe drop
> > last sentence.
> >
> >> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> >> ---
> >>   .../bindings/rtc/microcrystal,rv3028.yaml     | 56 +++++++++++++++++++
> >>   .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
> >>   2 files changed, 56 insertions(+), 2 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> >> new file mode 100644
> >> index 000000000000..4abe4756bc9b
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> >> @@ -0,0 +1,56 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/rtc/microcrystal,rv3028.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Microchip RV-3028 RTC
> >> +
> >> +allOf:
> >> +  - $ref: "rtc.yaml#"
> > Drop quotes.
> >
> >> +
> >> +maintainers:
> >> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> > This should not be maintainer of subsystem but maintainer of device
> > (unless it is the same person?).
> >
> Hi Krzysztof,
> 
> who would be the maintainer for this RTC?
> I am not able to find a maintainer.
> 

I am the maintainer for this RTC driver

> Can I keep Alexandre Belloni as the maintainer since there seem to be no 
> maintainer for the RV3028 RTC.
> 
> Regards,
> Wadim
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
