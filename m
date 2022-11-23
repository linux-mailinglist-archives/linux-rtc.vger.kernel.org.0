Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDFF6351A8
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 08:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236308AbiKWH4h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 02:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236375AbiKWH4Q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 02:56:16 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D23312
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 23:55:35 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id l24so11181040edj.8
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 23:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXVfenqOUGvkDcVYgY1fJsrmESMj2EN+C8xawwYRbqg=;
        b=GSONFRDtFGziegwWTFEClQCF/LKe/nWX5ILjF0ekcXzb0ia4P/thIuDwNN37Lbl+fd
         cmlyzBOAIz0t0R5nmsxb0s9614QO8jvKGSpqnqm2nSB59VI3OveWpsz5ZlcsmLPTLWx3
         Vo46D5fb+jy2iZrsqvOdAQ9XbsdWGcjdil1QZheDYlCs8e5sAuH4oXoMXU7PQWIONrje
         1I33Hy6SNJF0BnBuzoZMcYgdf4vgOcmpal6bmTDxFBSf7V5v23sctEb1cFr9z/W+X5JC
         m76zmuy5sJ58h29VstVv57dguBVw9sNwC3/wl6KlryYcuw1gR6UrsvGAUiLw8Dx5I2dc
         ULsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXVfenqOUGvkDcVYgY1fJsrmESMj2EN+C8xawwYRbqg=;
        b=M+zq+hS4jmp18lSUgvxoaz1exmoCfmAwpUxD7MK9eRDwwhkCoORZ9P3vA5B+nOR/A+
         VArBCJCMK0akZ81fGjTIEDBoiOqBHj8d46OqslO9tdmdyk6MF1Qq9byAHGpmmqXjpry0
         3quKCdaujPLQPllXxIUxx58JncuzLGA96NYIovUe8VidR8WEcFyQYxbg3SeSSXJ+A9Bj
         vFoDfe7t547MsIJLglOa/lNmccrMJzgP+vFTvncbOzgues6v4fnUboim0a/RFb4Vt0Vw
         bTC6Ljr85t1Xg3zcNQnND3fkWpq7TTj39YKCur+eTk79k5hD/NW2HPMLL7cO/JvnuRGx
         3ylQ==
X-Gm-Message-State: ANoB5pmpAEAefKk0sQoDw8UePGN8EKbcHCjm5dwVfh6TulzGE0y6Yo31
        OnbWmjRfGkP0owfNkIrzEYiuaJQmFog6b4Mt96M=
X-Google-Smtp-Source: AA0mqf6RNsjLhu4unf0H4XYSSKZNW2ozS8ZdX7vO3gTsICPumukQw5EMTVS4VXP7Lsculr2C6R1oHhXZo7WLRAx3QLo=
X-Received: by 2002:a50:fb89:0:b0:461:ecca:e8a with SMTP id
 e9-20020a50fb89000000b00461ecca0e8amr25041841edq.139.1669190134180; Tue, 22
 Nov 2022 23:55:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:131b:b0:7b5:2e0e:6ab with HTTP; Tue, 22 Nov 2022
 23:55:33 -0800 (PST)
Reply-To: antoinette_navarro@aol.com
From:   Antoinette Navarro <a.navarr21@gmail.com>
Date:   Wed, 23 Nov 2022 08:55:33 +0100
Message-ID: <CAPZQ7Viyd_ci2eb0W+uNOiWukF72h0e-fYBF_dnoc1RSpE+F0w@mail.gmail.com>
Subject: Bonjour
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:544 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [a.navarr21[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [a.navarr21[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--=20
Bonjour

Je sais que mon message sera une grande surprise quand il vous
parviendra. Donc, je m'excuse aupr=C3=A8s de vous. Je vous =C3=A9cris
sinc=C3=A8rement afin d'obtenir votre aide et votre confiance qui peuvent
me permettre de mener une action sociale avec vous. C'est une donation
de 750.000=E2=82=AC et c'est une proposition tr=C3=A8s sinc=C3=A8re et nobl=
e que je vous
fais. Je m'appelle ANTOINETTE NAVARRO, une ressortissante fran=C3=A7aise
qui poss=C3=A8de une entreprise en R=C3=A9publique du B=C3=A9nin qui =C3=A9=
tant le pays de
mon mari d=C3=A9funt Monsieur Delphin ASSOGBA.

Bref, je vis ces derni=C3=A8res heures a l'h=C3=B4pital CNHU Cotonou B=C3=
=A9nin =C3=A0
cause de mon =C3=A9tat de sant=C3=A9. j=E2=80=99ai pris personnellement l=
=E2=80=99engagement de
vous l=C3=A9guer avec tout l=E2=80=98amour de Dieu et dont je vous demande =
de
garder en confidence, parce que faisant recours au verset: Matthieu
6:1 de la bible je ne fais pas ce don pour =C3=AAtre bien vu.

Si je vous ai choisi ceci n'est que l=E2=80=99=C5=93uvre de Dieu et certain=
ement
vous =C3=AAtes une personne honn=C3=AAte et int=C3=A8gre. Avant que je ne v=
ous aie
envoy=C3=A9 mon message d'appel j'ai veill=C3=A9 la nuit malgr=C3=A9 mon =
=C3=A9tat de
sant=C3=A9 en priant Dieu le tout mis=C3=A9ricordieux qu'il puisse me chois=
ir
une personne honn=C3=AAte qui saura user de mon argent dans de bonne
circonstance. Mon l'objectif est d=E2=80=99aider les handicap=C3=A9s, les p=
auvres,
les sans-abri et les d=C3=A9munis tout en ouvrant une fondation pour
orphelins.

Je ne sais pas dans quel domaine vous travaillez, mais j'aimerais que
vous profitiez des fonds pour les organismes de bienfaisance. J'ai
d=C3=A9j=C3=A0 discut=C3=A9 de cette action avec mon notaire et si vous acc=
eptez de
b=C3=A9n=C3=A9ficier ces fonds et de bien les utiliser, pour plus de d=C3=
=A9tails,
veuillez me contacter par mon adresse mail personnel:
antoinettenavarro09@gmail.com

J=E2=80=99attends votre r=C3=A9ponse.

Mme ANTOINETTE NAVARRO
