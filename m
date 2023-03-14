Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB71D6B8757
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Mar 2023 02:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjCNBBh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Mar 2023 21:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjCNBBg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Mar 2023 21:01:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAD6911CA;
        Mon, 13 Mar 2023 18:01:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C663AB81690;
        Tue, 14 Mar 2023 01:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FEFC433D2;
        Tue, 14 Mar 2023 01:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678755692;
        bh=kGmcgrCDUa6ki8EJtk4PSH441MZFoE6sUS3W8B46Rd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=niX8lcqOVhJ37xzhYrZE92MS1uVd473rIP4FgSZXgtsfs+f7BEWTrKww6lfyRuz9l
         cSjqGvgrHCMtTqyoEYzuzYrRM8pGoBo2QB881wr/CCqPG3//heXBxzg2wNaAhwg+ez
         V8XNsvt7ytdBuZlZFbRWsY1XzmgTpkUt4Uz8GTaIwRmZAQpbGbPZrt3iCSEdNmVOS0
         g7w0fJ1qiBGSjxiTZejL2eEAlORG7dfJFeotakCFhT4ty5+T6XubebBRC6WPAPxgBC
         8uZ913y7N2J+YSbzg9JUey34lwedPPzMJ69mfWPH/b/Pj8xAy8wDnk7XLTnrH5GbqG
         0tWk/wFrM/UFA==
Date:   Tue, 14 Mar 2023 09:01:25 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.hauer@pengutronix.de,
        dmitry.torokhov@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v5 3/3] arm64: dts: imx93: Add the bbnsm dts node
Message-ID: <20230314010125.GW143566@dragon>
References: <20230215024117.3357341-1-ping.bai@nxp.com>
 <20230215024117.3357341-4-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215024117.3357341-4-ping.bai@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Feb 15, 2023 at 10:41:17AM +0800, Jacky Bai wrote:
> Add the bbnsm node for RTC & ON/OFF button support
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied, thanks!
