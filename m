Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99CFA61F031
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Nov 2022 11:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbiKGKVY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Nov 2022 05:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbiKGKVR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Nov 2022 05:21:17 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AF317E16
        for <linux-rtc@vger.kernel.org>; Mon,  7 Nov 2022 02:21:15 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id h14so10113570pjv.4
        for <linux-rtc@vger.kernel.org>; Mon, 07 Nov 2022 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOmtRIzmF5dcnWrT0j3skK83MYTC+QvduwZ6ndeN2Ks=;
        b=L9okY7Icb0Gf5ctoFsS3m7Ms6FyffuhIG/wumllqb99pGSDM0eKoVdXRomu4k2Vvje
         vaAAA5b5CG4T9vL3DYzTbt6i7ilTYVRiZHeAf51qWroCKMi/06UV8twkwYbbvcb58b0c
         O8aiXYIeKLPGKFxD8AeTNjdm9XiiwAwYXXYnxXnBzQtt4ZaPQYbu2mn3d4/wBF5dq0sI
         fYgKey8dWac3TMQ3pm+aZLL8XgADS0c8wc9DQhJYDoGLimjkDspSigMMA/pe1/be4Mmf
         FTMTprRtatoAeN10/4e16TIuQYPcJ6zZ7AsqjnUqg8Bde3BWUPkO4V20s/KjpolOjYbD
         1dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOmtRIzmF5dcnWrT0j3skK83MYTC+QvduwZ6ndeN2Ks=;
        b=OYxtWE6GT+dwmb4Ebwy3WVK6l9m4rv2kKTarbI55rscUKlLHLUVaWYXTQmXkI0DTzd
         SY9fRbzkocuyqxsxbIOXHMKuyAjoZAOJS1xWudB549xu5xXfL1x3kzcQaSbV1zmwDYXy
         WaRFUbdThJkfTMgR6KmYMR5M8iRC9sm0ZqW+Bw+cnwqeqozkq5Ex3u1UHms0I85jJ0yF
         Q3anOiE3sisZZY6XiHmQ2WF8B0dbRhKQTL4F2QUHN/K9blwn73mVNMrQ3g23oiKofwOr
         Ffsw4RMXHbOLuGJABEanhvb//zy1RMXmwaIPab7lgwgb16tUGiB1dtJMCgoluwM+Y+Dh
         TYBQ==
X-Gm-Message-State: ACrzQf3n4hTiPTTgBklNuRtM9znAbTGhKmSmsXvzqtx5kkIfIb6xDWQ/
        /do1vmCUMYo9/ylDHJNEfaVKeif04P81KEOkkm0=
X-Google-Smtp-Source: AMsMyM4Z92xjGZXgCyg2wym9Bu3/u65n6EL2ZpWI9kWf7s8xWZden0QG/zdZVfFd3uCVmOfceIs+YigxV7lXSF4Af+Y=
X-Received: by 2002:a17:90b:2393:b0:213:ecb2:2e04 with SMTP id
 mr19-20020a17090b239300b00213ecb22e04mr38944517pjb.100.1667816475223; Mon, 07
 Nov 2022 02:21:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a06:925:b0:587:19e0:c567 with HTTP; Mon, 7 Nov 2022
 02:21:14 -0800 (PST)
Reply-To: contact@ammico.it
From:   =?UTF-8?Q?Mrs=2E_Monika_Everenov=C3=A1?= <977638ib@gmail.com>
Date:   Mon, 7 Nov 2022 11:21:14 +0100
Message-ID: <CAHAXD+Z_SoFK+TjW_6apBCCLtc_awXEjaqOdf77jdLRxxup3TA@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.6 required=5.0 tests=ADVANCE_FEE_2_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FROM_STARTS_WITH_NUMS,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1043 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.7 FROM_STARTS_WITH_NUMS From: starts with several numbers
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [977638ib[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hei ja miten voit?
Nimeni on rouva Evereen, l=C3=A4het=C3=A4n t=C3=A4m=C3=A4n viestin suurella=
 toivolla
v=C3=A4lit=C3=B6n vastaus, koska minun on teht=C3=A4v=C3=A4 uusi syd=C3=A4n=
leikkaus
t=C3=A4ll=C3=A4 hetkell=C3=A4 huonokuntoinen ja v=C3=A4h=C3=A4iset mahdolli=
suudet selviyty=C3=A4.
Mutta ennen kuin min=C3=A4
Tee toinen vaarallinen operaatio, annan sen sinulle
Minulla on 6 550 000 dollaria yhdysvaltalaisella pankkitilill=C3=A4
sijoittamista, hallinnointia ja k=C3=A4ytt=C3=B6=C3=A4 varten
voittoa hyv=C3=A4ntekev=C3=A4isyysprojektin toteuttamiseen. Tarkoitan saira=
iden auttamista
ja k=C3=B6yh=C3=A4t ovat viimeinen haluni maan p=C3=A4=C3=A4ll=C3=A4, sill=
=C3=A4 minulla ei ole niit=C3=A4
kenelt=C3=A4 perii rahaa.
Vastaa minulle nopeasti
terveisi=C3=A4
Rouva Monika Evereen
Florida, Amerikan Yhdysvallat
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Hi and how are you?
My name is Mrs. Evereen, I am sending this message with great hope for
an immediate response, as I have to undergo heart reoperation in my
current poor health with little chance of survival. But before I
undertake the second dangerous operation, I will give you the
$6,550,000 I have in my US bank account to invest well, manage and use
the profits to run a charity project for me. I count helping the sick
and the poor as my last wish on earth, because I have no one to
inherit money from.
Please give me a quick reply
regards
Mrs. Monika Evereen
Florida, United States of America
