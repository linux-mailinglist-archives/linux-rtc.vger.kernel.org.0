Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009E657D9ED
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Jul 2022 08:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbiGVGCe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Jul 2022 02:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiGVGCe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Jul 2022 02:02:34 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC12545DC;
        Thu, 21 Jul 2022 23:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658469753; x=1690005753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PYLG/lDjtq6vMIuts4t9YgLPP533FkZvqJDjS73Bxmg=;
  b=n9p5PDdNRspRj1HNxlJMNrPl+wvl2IKZW58M0RL/LIgrnXA4gYHq7yeM
   Jqf5xk0i7EvRzkkEWc3NspCeupe47JneBeJaQj8i9DxREw6pKB1M+YPlV
   YEvlu1c+Du15xbBCW05qHXLfvtWj5cbyq0hSWbXcQVil92/KqfkXR6bel
   Ho18OSqbBzs/z0xSF+jcPJF+P1HX1GE7IqLYbI4bWA9J1bdqaz2YyQS+L
   5930wsorJxh7bAYRYZ44Y3CTGmKFT0IoRcZKKc+N27WKAY4yQJXzEnLdW
   Pu8tAc96bCZ9JnFu0diE+SfXGqNlXkjebYE2XAXpeXvT+XE0OcR5ipy/z
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,184,1654552800"; 
   d="scan'208";a="25198646"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 08:02:31 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 08:02:31 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 08:02:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658469751; x=1690005751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PYLG/lDjtq6vMIuts4t9YgLPP533FkZvqJDjS73Bxmg=;
  b=HKc6fY7Y0pmrX+yqH3GuB8WwKAsIo1CMNu0xZS+5yTzcRnzehSN4fpgn
   m9qXWgrSR3El6U8gTS2og+c4JBcx/W5qlqJ//oGvCU/i3ifOXjDPyzN8i
   FGwUN5u6jVjbRSpzb83GTGHI6TG64fipJ7Xb66MsJtkOS/VgqnG+bTVvA
   ujw2aKDp22B4hCIRI6KwCTvt8vFfQh6nhHF5Q/EjJ/oqkZS9bP/cQVric
   C542jzqs0/Rs3dYXMmnsYyekMz+AEy5136fMGPLU+Ab0d/KVzVDgCgBIq
   tl31R1+Qqg0SpJMuVLLlQI0iZ2MyR/UpSovM6QjpmXJ1H06oHN1xIgYIp
   w==;
X-IronPort-AV: E=Sophos;i="5.93,184,1654552800"; 
   d="scan'208";a="25198645"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 08:02:31 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2099F280056;
        Fri, 22 Jul 2022 08:02:31 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: rtc: nxp, pcf85063: Convert to DT schema
Date:   Fri, 22 Jul 2022 08:02:28 +0200
Message-ID: <5761215.mogB4TqSGs@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5c90ef96-969c-728a-3987-5793956c5224@linaro.org>
References: <20220721133303.1998356-1-alexander.stein@ew.tq-group.com> <5c90ef96-969c-728a-3987-5793956c5224@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Krzysztof,

thanks for your feedback.

Am Donnerstag, 21. Juli 2022, 15:43:13 CEST schrieb Krzysztof Kozlowski:
> On 21/07/2022 15:33, Alexander Stein wrote:
> > Convert the NXP PCF85063 RTC binding to DT schema format.
> > 
> > Add 'interrupts' and 'wakeup-source' as this device has an interrupt
> > which was not documented, but is in use.
> > 'clock-output-names' and '#clock-cells' are added as well, those were
> > probably missed when adding clkout support in commit 8c229ab6048b
> > ("rtc: pcf85063: Add pcf85063 clkout control to common clock framework")
> 
> Thanks for adding it here, this sounds fine but brought my attention to
> interrupts and quartz-load. It seems that only rv8263 supports
> interrupts. In the same time rv8263 work only with 7000
> quartz-load-femtofarads.
> 
> If that's correct, you need to put "allOf" after "required" and inside
> "if:then:" restricting it. For rv8263 interrupts:true and quartz as
> const 7000, for else: interrupts:false.

It is slightly different. In all the datasheets I found there was an IRQ pin, 
so this applies to all models, although only some of them (PCF85063A, 
PCF85073A and RV8263) support alarms, which is what Linux cares for right now. 
But this is handles in the driver already.
quartz-load-femtofarads does not apply to RV8263, because it has no OSCI pins 
at all but uses an onboard oscillator. See commit 5b3a3ade0293 ("rtc: 
pcf85063: add Micro Crystal RV8263 support") for that. But this also handled 
in the driver already.
Apart from that apparently only PCF85063 has a fixed quartz-load of 7pF, the 
other types supported can have either 7 oder 12.5 pF.

Best regards,
Alexander



