Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 105A95815D4
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jul 2022 17:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbiGZPAk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jul 2022 11:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238739AbiGZPAj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jul 2022 11:00:39 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF1C240B5;
        Tue, 26 Jul 2022 08:00:37 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3149BFF813;
        Tue, 26 Jul 2022 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658847636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DraaBxpt13vT2OYQx+ImtKU2zCJMxssq63gtcac1kv4=;
        b=cAJmw2DI42AJW/wHS7IhYc0xDwClKeGF2oSi3tpSA6qGIKS7hg4zV2pt1ehxBsOhH2KFLI
        6tR4y0561YYAXKDkmTy65xm8NQE1L472lVAhhHbkJV8u/UMhkwkvz65p0X0rme/xQkAuPd
        ZoYCm4WDlcw4c5EJbim81k0rByWn+xLLA0fNMetWyvRvOP5qk+8qF+pqRGqvzUryRLbrmL
        yR9bIe0LnJhGdsZP3+xN7fFxtDPBaiisI+ZSe4AZkwB6rwuHt1shwqctPGWk9OXWvQkOsT
        bZLwfoFSPEkAhe8V817dxrYt3NFK10FxGVmre6owzZ4z620Cwov9reCjc3W47g==
Date:   Tue, 26 Jul 2022 17:00:32 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     alexander.stein@ew.tq-group.com, a.zummo@towertech.it,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: rtc: nxp,pcf85063: Convert to DT
 schema
Message-ID: <165884761584.3162909.14717319628949335829.b4-ty@bootlin.com>
References: <20220725071919.25342-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725071919.25342-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 25 Jul 2022 09:19:19 +0200, Alexander Stein wrote:
> Convert the NXP PCF85063 RTC binding to DT schema format.
> 
> Add 'interrupts' and 'wakeup-source' as this device has an interrupt
> which was not documented, but is in use.
> 'clock-output-names' and '#clock-cells' are added as well, those were
> probably missed when adding clkout support in commit 8c229ab6048b
> ("rtc: pcf85063: Add pcf85063 clkout control to common clock framework")
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: rtc: nxp,pcf85063: Convert to DT schema
      commit: 10e1fb88c7b7e71ae04895511f4f98a7721c9e6e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
