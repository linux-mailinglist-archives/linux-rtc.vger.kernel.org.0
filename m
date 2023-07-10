Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF0CF74D58A
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Jul 2023 14:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjGJMeH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 10 Jul 2023 08:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjGJMeH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 Jul 2023 08:34:07 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85874B1;
        Mon, 10 Jul 2023 05:34:06 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-579e5d54e68so54860287b3.1;
        Mon, 10 Jul 2023 05:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688992445; x=1691584445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJAn4Li3Wmt9lr7URXAwruSI5yJiWyIINUiDT5ADsW4=;
        b=X7MFUe5gYtJrSYJW7B9nhFpVI/C/X+Xa7hbemtqaNbk3zmuplV2gaGiz6ATFQsr92u
         S4qrp0QJGEbgGQKmU2Ou6XRuQbp2HgEqDbnpwDef9vGv1InFaS2eivzch6n5+Ef9NVFW
         +6MnvATNxZJsv6d9lCt97dJVtPBMsMAqxiFR0idpC1oKqIuoWsRRrNXaeMTEooG16orT
         MD/6vkMTcb751XzZgr7bKhqZnzvtMGco8PBLSdFRyz+h9NsmZIMQMqTnuFvBIUUiCNQK
         UyqDFNqD1k2KYKVoba/NoFZ2rkS6gqOvKvWUEaEilozU3sWmz8+RG1xfG8DfV+RGDGrI
         UhZw==
X-Gm-Message-State: ABy/qLY1BKyBbI8XLErcIh+wvDEyhmDy9YvP8Q8HfYmOSrNy9w6lJwI/
        cnpdqlI9oDnf9vdUx/7c9ht29mWuR75BEg==
X-Google-Smtp-Source: APBJJlHetXOsUN7SHlsonWGCqx+0XJ9b9fmAfZuj+NxshC1QMS4UeDMzhXOz7b77aF5IjT0WVCSiVA==
X-Received: by 2002:a0d:d652:0:b0:569:feee:3950 with SMTP id y79-20020a0dd652000000b00569feee3950mr12628651ywd.2.1688992445587;
        Mon, 10 Jul 2023 05:34:05 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id m7-20020a0dfc07000000b0056cd44f9f23sm2991229ywf.63.2023.07.10.05.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:34:05 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-bff27026cb0so5454110276.1;
        Mon, 10 Jul 2023 05:34:05 -0700 (PDT)
X-Received: by 2002:a25:5842:0:b0:c39:e0f5:8616 with SMTP id
 m63-20020a255842000000b00c39e0f58616mr10718322ybb.46.1688992445124; Mon, 10
 Jul 2023 05:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230710114747.106496-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230710114747.106496-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jul 2023 14:33:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrk092sGRh2HakcicnPrQAWTs-HTwfzj7B9EYCVqO-fA@mail.gmail.com>
Message-ID: <CAMuHMdWrk092sGRh2HakcicnPrQAWTs-HTwfzj7B9EYCVqO-fA@mail.gmail.com>
Subject: Re: [PATCH] rtc: isl1208: Simplify probe()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jul 10, 2023 at 1:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Simplify the probe() by replacing of_device_get_match_data() and
> i2c_match_id() by i2c_get_match_data() as we have similar I2C
> and DT-based matching table.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
