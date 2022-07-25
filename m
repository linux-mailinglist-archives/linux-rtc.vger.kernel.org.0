Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69B26580074
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Jul 2022 16:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbiGYOJN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jul 2022 10:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbiGYOJM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jul 2022 10:09:12 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62B013CC6;
        Mon, 25 Jul 2022 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658758151; x=1690294151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=00140F0rZOP/2SJm76AV+KTpZ9Upe2y8fKBofBgoLpo=;
  b=XJFRiePeoyRYYDsbcAUlC9cZ7uEPQgSMYkZbe/fCqTN92FU4qaBsRVX5
   oEoKFRgg5GukQy7W3i0SIQkBeyWnyMj9ad/4pRPivDiHwe1otg5lSyfMl
   v5zl6oBpS48QekPrb497DpqieN01TdQnF4VGmIkHENQ8YYrb4MK2niwSo
   GIHLckyMzo9/RfmpPyRG7XWe2DRXG8jvKTTCuvg8qg4JhuJvl5sEU/0ON
   3hjjdkbZtSWx0Z3D++28qY5XJmi6dxW2mEYTffZgzy75uYZLqKkiaEUQN
   A2f8chgVj64yjI7oDO/MdTBcS1ir4Yr9W/qM0GnFS1RMIMp9hE5enVLAy
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,193,1654552800"; 
   d="scan'208";a="25244102"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 25 Jul 2022 16:09:08 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 25 Jul 2022 16:09:08 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 25 Jul 2022 16:09:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658758148; x=1690294148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=00140F0rZOP/2SJm76AV+KTpZ9Upe2y8fKBofBgoLpo=;
  b=gEhlOds1j7ajjKmw15zPIWbWlSX7GDAPVDgshL9mku4nTIoMHQlxLEjS
   mSi7kg8IF8Gp4mEryUqSFpDGoVlMD/Z/Vv8foKYHd2EpvgiaMAihn+MR1
   iodNYRaxy744FTRLtSCaehJAbOWPzwIFDnZMhICMyvYh84c6b5CfnGQ2y
   dCkUOzFgPZnQma+MNIpMVAvv+ciUVPEqJ58euwoPOtEMwd1tGq6/ayBc1
   ExRqNBpMdnypcYsbIA/4VJbUwJf+04dbdERT/LaXmDUcGlTdSuYvzfruK
   17diO9rjp8tkLRuCj07PrUA7MD1DLmrs9yYglsOcfLpY9ZFJar0sZyCVi
   A==;
X-IronPort-AV: E=Sophos;i="5.93,193,1654552800"; 
   d="scan'208";a="25244101"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Jul 2022 16:09:08 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 19E24280056;
        Mon, 25 Jul 2022 16:09:08 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 1/1] dt-bindings: rtc: nxp, pcf85063: Convert to DT schema
Date:   Mon, 25 Jul 2022 16:09:05 +0200
Message-ID: <2838513.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <1658756202.615935.1989014.nullmailer@robh.at.kernel.org>
References: <20220725071919.25342-1-alexander.stein@ew.tq-group.com> <1658756202.615935.1989014.nullmailer@robh.at.kernel.org>
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

CC'ed Sam

Am Montag, 25. Juli 2022, 15:36:42 CEST schrieb Rob Herring:
> On Mon, 25 Jul 2022 09:19:19 +0200, Alexander Stein wrote:
> > Convert the NXP PCF85063 RTC binding to DT schema format.
> > 
> > Add 'interrupts' and 'wakeup-source' as this device has an interrupt
> > which was not documented, but is in use.
> > 'clock-output-names' and '#clock-cells' are added as well, those were
> > probably missed when adding clkout support in commit 8c229ab6048b
> > ("rtc: pcf85063: Add pcf85063 clkout control to common clock framework")
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Krzysztof, thanks for your review.
> > 
> > Changes in v3:
> > * Added constraints for rv8263 & pcf85063 regarding
> > 'quartz-load-femtofarads' * Fixed example
> > 
> > I have to admit I could not actually verify in the registers that pcf85063
> > is limited to 7pF. I was not able to find any datasheet containg the
> > registers, only a product brief [1] indicating this limit.
> > 
> > Changes in v2:
> > * Sorted compatible list
> > * Mentioned new #clock-cells and clock-output-names properties in commit
> > message * Removed 'interrupt-names', not needed/used anyway
> > * Fixed quartz-load-femtofarads defintion/description
> > 
> > [1] https://www.mouser.de/pdfDocs/NXP_PCF85063_PB.pdf
> > 
> >  .../devicetree/bindings/rtc/nxp,pcf85063.txt  | 32 -------
> >  .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 92 +++++++++++++++++++
> >  2 files changed, 92 insertions(+), 32 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
> >  create mode 100644
> >  Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/
> 
> 
> rtc@51: 'interrupt-names' does not match any of the regexes:
> 'pinctrl-[0-9]+' arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb

This is expected, patch for removal is already prepared.

> rtc@51: quartz-load-femtofarads:0:0: 7000 was expected
> 	arch/arm/boot/dts/imx6dl-skov-revc-lt2.dtb
> 	arch/arm/boot/dts/imx6dl-skov-revc-lt6.dtb
> 	arch/arm/boot/dts/imx6q-skov-revc-lt2.dtb
> 	arch/arm/boot/dts/imx6q-skov-revc-lt6.dtb
> 	arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dtb

Oh, this is interesting. Sam, as the author of imx6q-skov, do you happen to 
know if "nxp,pcf85063" used in arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi does 
actually support 12.5 pF?
Well, if in doubt I would rather remove this restriction.

Best regards,
Alexander



