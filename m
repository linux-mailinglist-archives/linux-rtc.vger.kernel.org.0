Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2059E44CF27
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 02:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhKKBqM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 20:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhKKBqK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Nov 2021 20:46:10 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20FEC061766
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 17:43:22 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id bl12so4347182qkb.13
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 17:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ti7WkCLQF0dVUpIdhiLvTzXgvpPlHD77cIXHQgV4Rec=;
        b=EYa2QkNYtPTXwou2mvSkn5MGqLVqOoi4UrhDCMEYLzVAgdA9nOnuYUVBS74QJgjnnB
         +vs2fRL3VlV9qxeFSUYO6DnoAePV2x52Io0vChgMuLnZjw+Dsvu2L47O6xOuEUXvOe9H
         sEn3eaRFTjKbRqcvvti9qR7kUZJcCZild2KgZNbR/E3Tk59M9V2WbDwpLa7L7rZmr6/K
         3GKELRzoycQibUMd4kPqqLvXaCQ9RzTsEdl0Ed45uBrw4sub1NxYwPQArrBVoKSJcYL0
         pNeRreykIULK1fHXJ9fkNGljMwKwJUackykQb6NKCZ4WTcWzYwTEWFjMhWHCiWvm1NEO
         YxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ti7WkCLQF0dVUpIdhiLvTzXgvpPlHD77cIXHQgV4Rec=;
        b=BO7RUfSSgP9ry2cHiENsZ57gfUutSNiF7GRuGRuIT4tyE2sz4anmwS7UJicfUWanbw
         8UUrRd5IToIau2somcmYqJ/qF4JW4lLISfF44uGTRag99X8j7LGWdZFEhpVCzx62f1Cx
         704ZpHZsx7jsYF2Sk2iNJaByuCDPchiVk8SSpTWFSmffzqQ1qXCcubp/vcyT2EnLHFUf
         qdyPDlKSJqsSNP4up5zaAhLhnThWHXlimLV2IqkW+b8CMxlUy7+sw2YtrN+kvwLNZPCU
         jle44DtzsKo8jdT/ywUrc5mXUkL4PgZCq5VkKQPcQ618Np4dwZ03mYJZ2M9j/nyxC6p4
         2bog==
X-Gm-Message-State: AOAM532UKQsSv/gB3ecjA5WuKIMSy/R11CsTAIXqIdRbhbB08TjkyNM1
        rHhnxRPTTNsYnp4OguufdEsA8gFhKfauTrjD
X-Google-Smtp-Source: ABdhPJzPLF3Ty8oE8z+P/F118qPpPi+Zm8xd9hGU61nmZIAptVioAsdLxRvAmDVMYMMgjT/SMqeDnA==
X-Received: by 2002:a37:9481:: with SMTP id w123mr3244384qkd.75.1636595001711;
        Wed, 10 Nov 2021 17:43:21 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id g19sm1004019qtg.78.2021.11.10.17.43.21
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 17:43:21 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f182.google.com with SMTP id p19so3927109qtw.12
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 17:43:21 -0800 (PST)
X-Received: by 2002:ac8:5acc:: with SMTP id d12mr3970198qtd.32.1636595000843;
 Wed, 10 Nov 2021 17:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20211110132946.514825-1-festevam@gmail.com>
In-Reply-To: <20211110132946.514825-1-festevam@gmail.com>
Date:   Wed, 10 Nov 2021 22:43:09 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqymNyv=wP_p06ukPO=SVs4NvTXcgcjEUscKQGwmgUotA@mail.gmail.com>
Message-ID: <CAP9ODKqymNyv=wP_p06ukPO=SVs4NvTXcgcjEUscKQGwmgUotA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt/bindings: rtc: rx8900: Add an entry for RX8804
To:     Fabio Estevam <festevam@gmail.com>
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Em qua., 10 de nov. de 2021 =C3=A0s 10:29, Fabio Estevam
<festevam@gmail.com> escreveu:
>
> The Epson RX8804 RTC has the same programming model as RV8803 and
> RX8900.
>
> Add an entry for it in the binding document.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
