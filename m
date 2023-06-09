Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 761F0729248
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jun 2023 10:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239998AbjFIIJJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jun 2023 04:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240004AbjFIIIw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jun 2023 04:08:52 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690D13AAE;
        Fri,  9 Jun 2023 01:08:07 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b02fddb908so1503865ad.1;
        Fri, 09 Jun 2023 01:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686298086; x=1688890086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zODtk0XXM+5eN94PkG0h/aUoHz8Fu4m68SgxYkrg1tc=;
        b=KRZxbiznjuUq8/X27eUuWBa/T1lhLLn6IgUCabgWRnQ+9yN1AmP0/Csu16qs4zzowx
         az6xjaookljhRkBTkiby4hWt8FmQT1qpkC2tDfvecJcnljs6XVeOBE8WvEvFxGwt1ch3
         8HBjc9UQmP2zdEn5ghmLZy2X1WEStcoG0QxEVIF367H10u/RkY4MYiJVA4Z6mzWf5OHl
         sqMgpod63OytyS+CQdcEQOeDGBe2QW7UM76OsfEbjQBjOEFgIGFXJbgjatohP2rsig7H
         DJyI/3Ic4jNytas+L10MAzglAOWVjviWOoRM6aeUuxKhESW051W3jWMjtsqe0sjBkpAz
         HyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298086; x=1688890086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zODtk0XXM+5eN94PkG0h/aUoHz8Fu4m68SgxYkrg1tc=;
        b=ONpPNmrP2EXWG57E5buFuQjsokUmEiRsY1QcEyLqBXL4SF2u6N+P8e2lyeujRxzz/A
         dO5x2a5cXnA9piEF/mbHTM2FhNaGR+kJLaR9palgCta+QG67tQf39V8R4P2k71h9RGaR
         O2hztf/U1Tf696lR/I1ndwG5rvfuqnrYv/NgYNayKhd21ImjL4Q3o9DiTGfagvmPp9Lp
         2nn1CynHW7/SzfknQjZKFWh8n8irLc2rHlbq60rAOsB/2u1bDMCYKTKcwFViQAVU5oDq
         6yzyECEOFEzLBciCQyR8lg/ZGw3Hdddjck6RXgDwd4c32Z8D6FjUPhbqy2be9bE97JRD
         +K+Q==
X-Gm-Message-State: AC+VfDzoKEA9A/WG/1GJy7exdF+9WFf9UzPKWsDkDnT2M2LE0dPkl/4F
        rCorfwNTAGeirl7+z2mjdTajLa3yFwQ=
X-Google-Smtp-Source: ACHHUZ5ifxGYxZIDnOZNVMItsakmQVyQIYqg2KD612+ohCza/DU8AGi4oVLOgyPmU5011IXVdtZTfw==
X-Received: by 2002:a17:903:32d0:b0:1ac:6b92:a775 with SMTP id i16-20020a17090332d000b001ac6b92a775mr804492plr.6.1686298085775;
        Fri, 09 Jun 2023 01:08:05 -0700 (PDT)
Received: from zen.local (97-113-159-203.tukw.qwest.net. [97.113.159.203])
        by smtp.gmail.com with ESMTPSA id jl17-20020a170903135100b001b2069072ccsm2668879plb.18.2023.06.09.01.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:08:05 -0700 (PDT)
From:   Trent Piepho <tpiepho@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 10/11] rtc: isl1208: Add isl1208_set_xtoscb()
Date:   Fri, 09 Jun 2023 01:08:04 -0700
Message-ID: <5820492.tdWV9SEqCh@zen.local>
In-Reply-To: <20230602142426.438375-11-biju.das.jz@bp.renesas.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com> <20230602142426.438375-11-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Friday, June 2, 2023 7:24:25 AM PDT Biju Das wrote:
> 
> +static int isl1208_set_xtoscb(struct i2c_client *client, int sr, int xtosb_val) +{
> +	if (xtosb_val)
> +		sr &= ~ISL1208_REG_SR_XTOSCB;
> +	else
> +		sr |= ISL1208_REG_SR_XTOSCB;
> +
> +	return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, sr);
> +}

Since the contents of this register are preserved by battery power, it will
normally already have the correct value.

Setting it this way adds an extra I2C transaction to every driver init to
set the register to the value it's already at.

It would be better to check if the bit is not set correctly, and then only
set it and write to the register if it is not.

You can do that like this:

/* Strangely, xtosb_val of 0 means to set the bit and 1 means to clear it!
 * Hopefully, that is really what you want to do.  Seems backward of what
 * I would expect.
 */
static int isl1208_set_xtoscb(struct i2c_client *client, int sr, int xtosb_val)
{
        /* Do nothing if bit is already set to desired value */
        if (!(st & ISL1208_REG_SR_XTOSCB) == xtosb_val)
                return 0;
        sr ^= ISL1208_REG_SR_XTOSCB;
        return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, sr);
}


>  static int
>  isl1208_probe(struct i2c_client *client)
>  {
> -	int rc = 0;
>  	struct isl1208_state *isl1208;
>  	int evdet_irq = -1;
> +	int xtosb_val = 1;

So you assume XTOSCB should be unset by default?  Prior behavior of the
driver was to preserve this bit.  Maybe it was set the bootloader to the
correct value?  This would break such a setup.

> +	rc = isl1208_clk_present(client, "xin");
> +	if (rc < 0)
> +		return rc;
> +
> +	if (!rc) {
> +		rc = isl1208_clk_present(client, "clkin");

Why do you support two names for the same clock?  I don't see this discussed
in any of the threads.




