Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1429C77C131
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Aug 2023 22:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjHNUBo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Aug 2023 16:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbjHNUBR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Aug 2023 16:01:17 -0400
X-Greylist: delayed 60 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Aug 2023 13:01:16 PDT
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDA4170B
        for <linux-rtc@vger.kernel.org>; Mon, 14 Aug 2023 13:01:16 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id VdjYqXUkJv5uIVdjZqjjko; Mon, 14 Aug 2023 22:00:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1692043214; bh=VXmefjFl0zW0wmfjV/i8nsnPFN6ufqgMuy2mg0wWOvQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Ssyls8qCET3ouxCVoNHkGWYdB+3GpSvSXZA4E5XPAj0q6PM/3ZBLw3YqmvGe7y9nc
         Hv/qGrnfaVt6DTVI/sc9MbYZ+lkejaSEIBYB0yQiO6K5XfRt+Vq0Nk5vbxBBOU4Gip
         fZgKda6W+GZNTClic9Izz7hxjzpPRoMcIWa7Ciy3AwJAZqJLJbT6azf+ISb3dU/UZJ
         PUzKjmv3QCoZJQgYTxSzr7QeukPW9pu3QlsztM+Q12kzMV2aYWjGvbkNjSA1A1It+H
         aBd9CbAUVanK3o2mUpPIgehX5nmUqt/SyMazmjwteEm9wDoK2ZnRgLKovktK8XMxVA
         q5knjT1xhYVWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1692043214; bh=VXmefjFl0zW0wmfjV/i8nsnPFN6ufqgMuy2mg0wWOvQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Ssyls8qCET3ouxCVoNHkGWYdB+3GpSvSXZA4E5XPAj0q6PM/3ZBLw3YqmvGe7y9nc
         Hv/qGrnfaVt6DTVI/sc9MbYZ+lkejaSEIBYB0yQiO6K5XfRt+Vq0Nk5vbxBBOU4Gip
         fZgKda6W+GZNTClic9Izz7hxjzpPRoMcIWa7Ciy3AwJAZqJLJbT6azf+ISb3dU/UZJ
         PUzKjmv3QCoZJQgYTxSzr7QeukPW9pu3QlsztM+Q12kzMV2aYWjGvbkNjSA1A1It+H
         aBd9CbAUVanK3o2mUpPIgehX5nmUqt/SyMazmjwteEm9wDoK2ZnRgLKovktK8XMxVA
         q5knjT1xhYVWg==
Date:   Mon, 14 Aug 2023 22:00:12 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-rtc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-twl: add NVRAM support
Message-ID: <ZNqHzE+vn/RNoAtn@lenoch>
References: <ZDf7qZTiml0ijD2g@lenoch>
 <20230531041701.GH14287@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531041701.GH14287@atomide.com>
X-CMAE-Envelope: MS4wfJS/d65Y1A68uRc27IIg6upQ/JblrZ1MhGljs7MUt/MbPMbEv0+lqmW35ZFAxdoHjju/FAT4xM2ueEjEGOv8r4CFF0XzzBXBvftVO6OPeeQmUQIZ0w/i
 qDE5KHDnV0XyQtGzgksiZ5d6WR09xuVFxxer/yRW+/kMs7O/YFjo6e/xk68cVYHYMxbs3mgihhVuFUV6rCr1xxh4ig9E7r89Cyg+WK7SfalTiHSMNkbo9OzT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, May 31, 2023 at 07:17:01AM +0300, Tony Lindgren wrote:
> * Ladislav Michl <oss-lists@triops.cz> [230413 12:56]:
> > From: Ladislav Michl <ladis@linux-mips.org>
> > Date: Sat, 28 May 2022 19:36:13 +0200
> > 
> > Export SRAM using nvmem.
> 
> Reviewed-by: Tony Lindgren <tony@atomide.com>

Gentle ping... Is anyone going to merge this patch?

Thanks,
	l.
