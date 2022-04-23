Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA2E50C619
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 03:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiDWBoK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 21:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiDWBoJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 21:44:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B0E1A73F1;
        Fri, 22 Apr 2022 18:41:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 18598B83352;
        Sat, 23 Apr 2022 01:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56BFC385A0;
        Sat, 23 Apr 2022 01:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678071;
        bh=qrzYzxe8RPq/FTFvyHvEQiLMHVcoU2W9jDATI7yqDs4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=poTLwV7Fn6eVR3x528X6sZX8AfskaAnoyD8sY4EXsXurxN+orGD10wRNQ4tROykQf
         rr77fmDf/rPv7dlOxcgPYX5KrxZgFFDMskwj0WiG9E4jetllWLzEYJTmNxzCiQttXa
         wVRCSRtHEYigTh6bc+rONd1QLAAEy0ynCHYmf7wHs2t5voAQpHajFI6o6uwFq6m1II
         HrKmPTJBL5og0tD4HDDLwuQceFV+hPErLO2ygY5LGbBVXaVSS0uNyILXorha7/8X3q
         Q0OakPmgJ0N40WJyaFqJnuF/tGmepYqy0KdgrxSTcqv5Un9nhQkEClnWLWsN4Ep0Qt
         poVxeL4j0hcEw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-3-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-3-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 2/9] clk: microchip: mpfs: mark CLK_ATHENA as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Fri, 22 Apr 2022 18:41:09 -0700
User-Agent: alot/0.10
Message-Id: <20220423014111.B56BFC385A0@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:29)
> CLK_ATHENA is another fabric interconnect and should be marked as critical
> as with FIC0-3, since disabling it will cause part of the fabric to go
> into reset.
>=20
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire =
SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
