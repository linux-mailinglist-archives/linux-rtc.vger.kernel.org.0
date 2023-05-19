Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D1170974C
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 14:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjESMht convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 19 May 2023 08:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjESMhs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 08:37:48 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BE3F4;
        Fri, 19 May 2023 05:37:47 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ba829f93da3so4410581276.1;
        Fri, 19 May 2023 05:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684499866; x=1687091866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAznDGkQwRXLXXjAUDZo6ztSlsHLnEQJlAzfFula938=;
        b=ho0kp3x5TzAVPtv2rYVGCUtH8aSQUKeQy7ccxxlkY2kP8iyjwRGvziEzMXO59MumTI
         e1clu2MU3Zs2rlJ1ZykFHwtX79rrUGKK/FvqwbrDNwmlh4pQezNlgN/2aVJokbpjVlpB
         1xT4NDC5YGXqEj70PI+fFIM8/evJ4a7NyP+3s/nZkiZxYLC56+qbqsTz7HgBx1z2npPH
         SSqBqZYaKpUUEfxoz5Ag4smE2FznuzGyT17/lo+GisQG7A+S3OUxCGyvBK7uNxmlPAsu
         llESVH9tmhISnybFi10Iav6yRFde1JwQP0DJE5ASLoV5cYQX12MANSz7PRaUUMRXl3J8
         mXnw==
X-Gm-Message-State: AC+VfDxVJTRzvsxIQT15Rxlv6Uj5QL5AHPntfRY+UM/B5vTChpM0FCTP
        OrYvHppjQY9WiFszfyvVpkZt/gO/Iezs7w==
X-Google-Smtp-Source: ACHHUZ6W83kJXl0c2Y1DtLSJ+V9FGW7kcv/yjpd+7AOnNzd5O6qLdHY9rxvVsdTK6ceh3Umi+0scDg==
X-Received: by 2002:a05:6902:1207:b0:b9e:5fa1:7ab with SMTP id s7-20020a056902120700b00b9e5fa107abmr1740981ybu.23.1684499866311;
        Fri, 19 May 2023 05:37:46 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 4-20020a251304000000b00b9a80b9e08esm1013985ybt.12.2023.05.19.05.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 05:37:45 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bab8f66d3a2so7710276.3;
        Fri, 19 May 2023 05:37:45 -0700 (PDT)
X-Received: by 2002:a25:a1c9:0:b0:ba8:61f8:8eed with SMTP id
 a67-20020a25a1c9000000b00ba861f88eedmr1500340ybi.0.1684499865314; Fri, 19 May
 2023 05:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com> <20230518113643.420806-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 14:37:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+KETqQdPkavGbVOKWEYiPD3+8tkhWthzLNmykBuNLQA@mail.gmail.com>
Message-ID: <CAMuHMdX+KETqQdPkavGbVOKWEYiPD3+8tkhWthzLNmykBuNLQA@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] rtc: isl1208: Drop name variable
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Drop unused name variable from struct isl1208_config.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * New patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
