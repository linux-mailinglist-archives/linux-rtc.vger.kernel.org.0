Return-Path: <linux-rtc+bounces-81-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2F7BF5A6
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 10:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF3A8281A98
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 08:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB034156F3;
	Tue, 10 Oct 2023 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="G6A+LG/l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F2156E3
	for <linux-rtc@vger.kernel.org>; Tue, 10 Oct 2023 08:24:47 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3C297
	for <linux-rtc@vger.kernel.org>; Tue, 10 Oct 2023 01:24:45 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c296e6543fso66105681fa.3
        for <linux-rtc@vger.kernel.org>; Tue, 10 Oct 2023 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696926284; x=1697531084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX25oi0TLFjjBEfrkFbaH0utg1e2SC6E+qDGBgsDQdo=;
        b=G6A+LG/lVb/gMdPuzC/reTnMsTS474QHAkX2wBM+2ZyMHR3YLaeV0fJydXUsJ7w3Fn
         oy/58WqyarKKjQkZlGIzLJXNBOXBU2AuftG7UAkyeSiJd/Eent952juj05Cdl2GuSyoY
         UreDa0eCu/QB9UdUOXECOHsogEGpYkcofnkfCF7Jf3dTcs2LT9AnmlVNKOyuVD3kjFxb
         RXPJN2+i6brcQeawq8nZW687zo7lfOGWGoPbBVrDlmXtWeToZrNWCYqETNxEUK4WWXTt
         cgGIwZ5WHjrq1emw1ZLFJPJraDEWZwEci/M2jC4RMzeVPCyo4lBbnyINotm3LeaaEGzy
         1aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696926284; x=1697531084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX25oi0TLFjjBEfrkFbaH0utg1e2SC6E+qDGBgsDQdo=;
        b=ibMe0p7UxlArMVM0S/1JTLcReb+N56cnPZzkv/tPaBeNzJ2sbnFTpXXveEGIksDxW4
         0rMOEiT9M+rYLJGQFpZiXTWI8yHKYMZ6ddIyo4SUo+e3R0/KC5APhTWhUp6OVXXFwU0x
         LT5dXRFe1nNMw7E4VfyWSxCvOaRT4HFJMmEWHDtonhcjC1P9VZpdrB3y+ipcATD2ylc+
         928ZOVuxRv79LufLxTN/nPZX8sDaVTC096YtsNdxB1K8zQ55XJV+6StLBNuadjk0tuwx
         hJEHDMqdaMGunRq4Dews3Rnfbzrg01wt4ksgitbqeT+kSEuESVz1w+Zyp2g2PbahLTn5
         nMbg==
X-Gm-Message-State: AOJu0YxQc/+OzBCoVTPLe2oCouLxrZp/j4Sis6sUnKEuFsRxhoRFzNnP
	3frmcELCBc6T6IOVAYIAMrWQDxqfui8Ry+rt3uD/Gw==
X-Google-Smtp-Source: AGHT+IHhrZiCx5s9X4MQiD/ZMSUpzqLwWRHkc3HfDvbsJDBkyyqNCsF6iTzVVnQFoGa3q3wDj0URozRl7VFxZ+eoCRo=
X-Received: by 2002:a2e:9ac7:0:b0:2c0:1a80:dfb with SMTP id
 p7-20020a2e9ac7000000b002c01a800dfbmr16890336ljj.27.1696926283756; Tue, 10
 Oct 2023 01:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009165741.746184-1-max.kellermann@ionos.com> <202310100815076048fb2c@mail.local>
In-Reply-To: <202310100815076048fb2c@mail.local>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 10 Oct 2023 10:24:32 +0200
Message-ID: <CAKPOu+9TKVAwQRBAquyK+TGdAzj_xtJLT0oobXM75zVLvRsYoQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] drivers/rtc/sysfs: move code to count_attribute_groups()
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 10:15=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> Shouldn't that live out of the rtc subsystem?

You suggest making this a global function? Sure, if that's preferred,
I'll change it. Whose decision is this?

