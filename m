Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD0E154536C
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jun 2022 19:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345174AbiFIRvs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Jun 2022 13:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345154AbiFIRvn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Jun 2022 13:51:43 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A06F31D0FC
        for <linux-rtc@vger.kernel.org>; Thu,  9 Jun 2022 10:51:41 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id j8so14946013qtn.13
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jun 2022 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=uETXtarVwZqoq55uxf85U5YgwPdkdqdQ5+5+F1r3C0I=;
        b=UDGOOky72jyL07Hua5xhTBDqYbAuu1peFfWmRCYXOir+bIonsZfuAJtYNmGWBPdSdp
         9+moDEFvyipsVEnQMhyLR2GDQcNQLhutuUbMQ+yly/LVK9rgX4enzJxrZCHQPhsyl8b8
         XtPkLKWrpl2Go8b1xlVRwAcC48jh4xOfXnOqs/cYw0nI/083+8R0YsS4GQRu83zteIIu
         0xeNCfssicXWd5d6jGS+LPBUYtS14lZLEiqsGgeanGl4xNNu59N1HDpfavzVxG2UMy00
         ebFyWbpMkyERyTQb2gk3xIsE9mFMTY5QK/EoQbVUUKOsGUZlOx/1yB6zAYhfk4xQD+xl
         biWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=uETXtarVwZqoq55uxf85U5YgwPdkdqdQ5+5+F1r3C0I=;
        b=nzu/ab/6ttJ+R3iT0Cn7KRIKnJmGokMZvtyOIeNWmXAnETcFzTqImDwizAuLL2R/yJ
         /mR4S+M7MGbhVY/fke7Erx2/fqYEZ1b2QHs3s6P/h2dtUjCUCb2jF45pcK/JGFNHigai
         qss6HofMOsPQPyl/vgMbNH/N2m1S48zurZrz+Wo5kiG42UmUsu0qLFKZp1yHrQ0wC/Xa
         JzhSl+YSr8YQl2qJoosOE0wCYZI3fENaPQkJ2BosPUPFpficg/4Rd9kLPKMQpPgKqrYm
         bHovVw/zRScWZFN6B/RvCqzDXMlm7Yor8ennf7oQwpwJXQwXz2ETisMxdtyx1KDPTdEi
         vuGQ==
X-Gm-Message-State: AOAM530h5XXRXbWGypVl9q/mGxB5J02f8ooVYi6Op4bhSxseMHwSKr+2
        TNh3aA4wjMUeLBedrHBeIk/lrvbWsx9WqHrU1+I=
X-Google-Smtp-Source: ABdhPJz9uDgn6plhYXX3UPAtsN2aRkEpgFG9wF17ebQAnW1rSRxwm+q4VUzDvYF7wNzUfJzDfqMT80Dv5ctUn8MKmkM=
X-Received: by 2002:ac8:5e4b:0:b0:304:f179:4e9a with SMTP id
 i11-20020ac85e4b000000b00304f1794e9amr15839558qtx.490.1654797100197; Thu, 09
 Jun 2022 10:51:40 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mihirpat56@gmail.com
Sender: charlesjuntikka2204@gmail.com
Received: by 2002:a05:6214:234a:0:0:0:0 with HTTP; Thu, 9 Jun 2022 10:51:39
 -0700 (PDT)
From:   "Mr. Mihir Patel" <ij261347@gmail.com>
Date:   Thu, 9 Jun 2022 10:51:39 -0700
X-Google-Sender-Auth: vXF71wuuneRQ7eGFZd9OCrfhhkA
Message-ID: <CAEOqroo9Yhh-4Sw+QQt-ZjL50JQ8nX3Mbji_QpO3Udz_NHdDjA@mail.gmail.com>
Subject: Greetings to you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=ADVANCE_FEE_5_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_SCAM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:82e listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [charlesjuntikka2204[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [charlesjuntikka2204[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mihirpat56[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 HK_SCAM No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.4 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Greetings,


I am contacting you for us to work together on a profitable business
because you bear the same last name with a late client of our bank. I
want to present you as his true next of kin to inherit his fund in our
bank. As his account officer I have some necessary documents in my
disposal to achieve this.


I therefore reckoned that you could receive this fund as you are
qualified by your last name. All the legal papers will be processed in
your name as the deceased's true next of kin.

Please revert back to me for further details if you can handle this with me.


Mr. Mihir Patel
Customer relation officer
