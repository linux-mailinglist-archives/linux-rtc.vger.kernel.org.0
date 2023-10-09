Return-Path: <linux-rtc+bounces-71-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D56697BE8D3
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 20:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61C2F28187C
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 18:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5069A38DFA;
	Mon,  9 Oct 2023 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="WhCTEDaI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BDF35880
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 18:01:58 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE13C94
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 11:01:56 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c008042211so57858301fa.2
        for <linux-rtc@vger.kernel.org>; Mon, 09 Oct 2023 11:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696874515; x=1697479315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIBVQXsnA0W0erqiHcGTS0gNQWv81FUdQVlHJTQQf1E=;
        b=WhCTEDaIUqBIMs3KFSQ8yzatL7D+AdVRPsAONP4cowP8Ui9fKLCIr/ZQLFqPos2JiF
         ubqDrwIKJDfOm+F8oM4Pn2VbzvZnQiOc8/JLzC4rZOz7B6n7P36lmm/y1Yoc/ABgb1Oy
         dzrxmW+fpv1GMvDZR6JfAYIdEPNdllC1NVYTOfM9Bmk+nIENPj93QggAkhih7qQ+rmJu
         CRuPXOB8WN1mY/SCu9IQ9RGotKnbsCSvRSmOPhBSeHFIgxm/PPPH4grz8vFkUZRe/7q0
         vWQPOCbbBITZzn4tNPW1gp9crvHSIJsl1lTzvN/Pkb0PVe4l1FCDAXyVz/r6tD2J3kO9
         4yPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696874515; x=1697479315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIBVQXsnA0W0erqiHcGTS0gNQWv81FUdQVlHJTQQf1E=;
        b=qZ5DFbwPMm3Omwc9A8Ch3u27wQAVDsxHAkRoAzB8bHvEaBn4O0Ku8DKcZKFeMvqROx
         jNYi9NrIm+1rB9wNm+sCitk8W5+ZFzv78TVWORqN3iENganhpXpGdiLVpTHeKG2h9BKm
         slE2JfzZcnbTDTj+yCTFWxXvmN75YB+uAaWa2DeIBsy4rywdn/ytx1Wz3FlPAGQf1Obk
         LzX6Ra795RMfXyED5bDPsBmcJGZ1O8vN52XHjcR0FYzqH/qvgQHuUtb6IBS2TMxEQnAK
         DrtQSQv/6KPfn8ZlLTH2kQ5knddYYssaEpDA6EEqp98Pjm3MCd55OvuMZrBrO7cv1pn9
         yArw==
X-Gm-Message-State: AOJu0Yzf+NR5KxvDL00RZcT6YInxKuq33/zUV4v9HxTbFoYNHgCfPyM2
	a8pZWK3DHJxuVVsW7qdUGTafMS37ArJ6O/XtKB7kgA==
X-Google-Smtp-Source: AGHT+IFyGgxuDPoZfAhdkd0KyG5vilYB/PEYGfiCygdIA1BUI/RGecyrUsLLaOQzqtRvqfF6Xgx0AY3Jocgh/Bk8CM4=
X-Received: by 2002:a05:651c:10e:b0:2bc:c650:81b with SMTP id
 a14-20020a05651c010e00b002bcc650081bmr13486770ljb.15.1696874514922; Mon, 09
 Oct 2023 11:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009165741.746184-1-max.kellermann@ionos.com> <2023100943-anew-choking-5954@gregkh>
In-Reply-To: <2023100943-anew-choking-5954@gregkh>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 9 Oct 2023 20:01:43 +0200
Message-ID: <CAKPOu+_CEJH0zfk5PQU5dxFY8ZiYjFvvAG2GXPM_3Fr2_om8Xw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drivers/rtc/sysfs: move code to count_attribute_groups()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 7:24=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> What 3 different purposes?

The variable gets initialized 3 times with different (unrelated) values:

1. count old rtc->dev.groups
2. count grps
3. allocate new rtc->dev.groups

This coding style is confusing and error prone. The code gets simpler
with this patch, because the cognitive load of understanding a
"count_attribute_groups()" call is lower than reading the "while" loop
and figuring out why it's there.

But I really wrote this patch because after making "rtc->dev.groups"
const, I cannot any longer assign it to "groups", because that
variable must remain non-const.

