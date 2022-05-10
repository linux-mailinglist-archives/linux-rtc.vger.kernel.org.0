Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E0C521BD4
	for <lists+linux-rtc@lfdr.de>; Tue, 10 May 2022 16:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242797AbiEJOWx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 May 2022 10:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344390AbiEJOV6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 May 2022 10:21:58 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E548C2B1652
        for <linux-rtc@vger.kernel.org>; Tue, 10 May 2022 06:48:39 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id p1so6652443uak.1
        for <linux-rtc@vger.kernel.org>; Tue, 10 May 2022 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PfSJGfYa3fRkIaqDdureN79xdBIPDnwqAgRaXPaX9Os=;
        b=weWWFqz10FQMpEm/oMdrWMHisyTUZ8FybXU1biKS0szIcQNwnSnru7Ka0DCIapc+qs
         FdZ9BbmeM8855UPpmZN2ZLehczN3qLG5lefD/6gybN490HxRt5QJasvuwyv4A/oiIS3t
         Ay4wXKxf0nipPrL3OBpy8/Nap7XTCorlK5ySF2AGwq2NnVLqC3/f9wv8ufS9EqSvxl62
         RYKT8vPF6OVHii2Ds1jTiXlqugB/pcvL9kZtGYdDG6g6/HdxNIRFq7Z2eevFfE7O0Pk5
         ctCUOk5uVHrgZch6A22NUGEgzKAYI5qPAYj7ynDzHzMo6j7nvZdGuxTNwGj1b1ea1Mhn
         U/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PfSJGfYa3fRkIaqDdureN79xdBIPDnwqAgRaXPaX9Os=;
        b=PYfF/IOHiX+1YDnE61y9pOWCUsRcRW7xHyT9iKJ6Ex4qpDrO4wsc/9kyR08P2XR9s7
         J2V1R2jeHu7wQMQHPm1cq8eZ1YfKKJC1eU2xYn1CdmOBTk5RHvk7acc9Fst/nrGe/HHd
         YHDoQatdDd9iaTGnkWfwZBXuA+RFT/uy/iXn/B+0tSJInE3RzDboV0pWSUrpSS3jXm3Q
         xmUh/xR0VQhjACEe227IV2oGOhBPiBpNA0hK4XbCyEnulriAoMLHbtqxH8dwxNloUdTz
         hurk5EAAhcyCAi6f3ZKI1X5li9P4xxPgkJ3RAAQpaDc4ftzIXsl4UtO42zjjVnOrOdVC
         U8mA==
X-Gm-Message-State: AOAM533mJedOljgk+U8pv+ql4K/jEZAnEX9QLXJ3yHfCw4h56egYsXjM
        vEzF6vDDOKY9m7KKp3IpwZ4q9s7pdkrEVYi6lFMv
X-Google-Smtp-Source: ABdhPJyTJUUCVyxRfKYRPeXJ9SzzzTp5vdPssK+x58MX7MUYjsqW0kFWULLq6N0re7qGKEVOQ+ZClJSpjEMAjJ1NJww=
X-Received: by 2002:ab0:15ae:0:b0:359:6107:43b8 with SMTP id
 i43-20020ab015ae000000b00359610743b8mr11603307uae.23.1652190518662; Tue, 10
 May 2022 06:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220505022314.59822-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220505022314.59822-1-chi.minghao@zte.com.cn>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Tue, 10 May 2022 22:48:12 +0900
Message-ID: <CABMQnVKw4htsqhwwzGuwyVO=zKqKeTP+SWEVLu_fYzsjmOaVSw@mail.gmail.com>
Subject: Re: [PATCH] rtc: simplify the return expression of rx8025_set_offset()
To:     cgel.zte@gmail.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2022=E5=B9=B45=E6=9C=885=E6=97=A5(=E6=9C=A8) 11:23 <cgel.zte@gmail.com>:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Simplify the return expression.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/rtc/rtc-rx8025.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 40AD1FA6
