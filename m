Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB243D03E7
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jul 2021 23:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhGTUvF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Jul 2021 16:51:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:60192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231974AbhGTUuo (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 20 Jul 2021 16:50:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8583160D07;
        Tue, 20 Jul 2021 21:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626816682;
        bh=i23eFEgSE0wuhLAejNnKB7S2wizVK8Av41Ojl11uxBc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Lbvp9Fb212Yc8Un6EW2mD0F1mM75CtTpnwORJkMUaJybD4UckohiEDWsY96OvIvY/
         RMasGoTavM8G+3+TeSFA66aUfTRcvF4rfti/jE71r3s+BVNwF9Ttj5oSGVZx0lA2Ge
         HZanppRxCOAvFHA2FzaskaqXlBnH1iO2G22G5raRiuodv3qyhUPDmqYxUWtzFNxElf
         F8D9s5hdiuvSokHUKzFcFMK2ytLuQUlgaqsW6EmSlX6XPdZUByZ7TomalyvZ1zqWFR
         RNXmivlQgfZ/BP/nDLU3NtKF7VwCAsBv9TNCXwWlBnuICmlGqt1MQ2BXsRgVepWxHe
         iKi8FVxQQfl8Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210713193453.690290-1-robh@kernel.org>
References: <20210713193453.690290-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: More dropping redundant minItems/maxItems
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-usb@vger.kernel.org
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date:   Tue, 20 Jul 2021 14:31:20 -0700
Message-ID: <162681668027.2679160.3696036662982059954@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Rob Herring (2021-07-13 12:34:53)
> Another round of removing redundant minItems/maxItems from new schema in
> the recent merge window.
>=20
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with t=
he
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooli=
ng
> will fixup the final schema adding any unspecified minItems/maxItems.
>=20
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sebastian Siewior <bigeasy@linutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-clk@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
