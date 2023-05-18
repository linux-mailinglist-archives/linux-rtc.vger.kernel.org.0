Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8517083E2
	for <lists+linux-rtc@lfdr.de>; Thu, 18 May 2023 16:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjEROYz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 May 2023 10:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjEROYz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 18 May 2023 10:24:55 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AE510D
        for <linux-rtc@vger.kernel.org>; Thu, 18 May 2023 07:24:54 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-53467c2486cso936619a12.3
        for <linux-rtc@vger.kernel.org>; Thu, 18 May 2023 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684419894; x=1687011894;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqyEPS3iMUxc76SEhJtwLts/CI3Xi7E/aFk+jvzg10A=;
        b=PFCek8xaxBZ9GWFrzogsICwh8v3d4gM9KOkC21vDYc0AgOMAmBdFTesSx2Dv9piaGN
         vQSeW8bRCL46eaV9erO6/EVJmldi0TYuRF1U8njqaL0PDq5nPo/QKtciJCkZ6GU1z4mB
         RO8paCrd1b0swQKG+rCuMHzcuMa32/+DRSClS0h4PP2WMDqGJ6KGcioDISjalxIIZsP/
         ESp5i6yaz2BON2ekejjDG0hiC5okP1QVCarwXbS/UHv9FfDHwVXT5iZDvIamV2xrYDOz
         tRGUmdVu3wrso2nBECLZ8QJT4oiPwn1VoFeWK8aahY4Idak7VbCCAO3ZsIm7VHdIFvyE
         zFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684419894; x=1687011894;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqyEPS3iMUxc76SEhJtwLts/CI3Xi7E/aFk+jvzg10A=;
        b=j1hRG2VMYgDjmy3Eifmxnj0bH537OcfiRsa2HzwYvb/fk+BQVhg+Gw92t8pUG0DgKJ
         1JnqU/TwMBm+Rf1KJLwFK/7TuW99NmnT+SqPDA6jCZQuElM3j6fabmsgsjp2kTFT8wLS
         C2DK4DPLjgg+m9CIzdPUbHxhT+4fZjVr2O2vrjqoma9o3XCtxCCcwCF0rINt5hZBPaRY
         IVTCQ5zP/XXf69+okHQFuh57LoRqgVVNq+ox5b/XMs8w+saN240VeDC8cnliXmnB9DT0
         Ptr4HaaupkIQvcOGQYh+JwCLF7xT8Q/ZDrhY7ambhn3sab8rGgziA/91+skWozMr7hNn
         2bpA==
X-Gm-Message-State: AC+VfDz0HdgzcP1JVMWD/8ROks9Pp4J3LcWb34B/phRcJBEQhrTl/ZQZ
        qYK8boTr03XsePAWVY7vx0ehuPuT2YV5KLTN2g==
X-Google-Smtp-Source: ACHHUZ6kuwmVLWTvbplK1R/WfWAGc3bF5TGzxIZPVSvk8McKl/PPwrGIEDt6hFBewrdkFhbmOtdfnjTTDh8ILQ0mZsU=
X-Received: by 2002:a17:902:d482:b0:1ac:8835:b89b with SMTP id
 c2-20020a170902d48200b001ac8835b89bmr2896556plg.5.1684419893712; Thu, 18 May
 2023 07:24:53 -0700 (PDT)
MIME-Version: 1.0
Sender: miraayaann@gmail.com
Received: by 2002:a17:903:3303:b0:1ae:5916:9f1d with HTTP; Thu, 18 May 2023
 07:24:53 -0700 (PDT)
From:   Mira Ayaan <mira.malakaim303@gmail.com>
Date:   Thu, 18 May 2023 23:24:53 +0900
X-Google-Sender-Auth: o6wfNJ0eCNdP05G9Oboy0f4yrpg
Message-ID: <CAD-xOMgN4C3+ijNoD0F=kFkvJ15JEcaM4nWpOFWtWvnch71pQw@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi, is me Mira, can you please tell me if you receive my previous email?.

Thanks
