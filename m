Return-Path: <linux-rtc+bounces-114-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D47CE65C
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Oct 2023 20:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41205281C25
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Oct 2023 18:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F044441238;
	Wed, 18 Oct 2023 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V5phy8EH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F72374D0;
	Wed, 18 Oct 2023 18:25:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932B7B6;
	Wed, 18 Oct 2023 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=99zA8o13/ejaEM2O9/K0kn45FaKKMRK+h1KEU8ji9+A=; b=V5phy8EHYfhtPfVyyG8Exv3G/r
	Pw9Vvflf4+xBXK/uMwG2DGE/qdGXwm9pcyW6dJo/OOocmhxsI9aB14b3THWJ5W1/ENsEgMQCTzTY9
	GArQsjXE+6rZK3EK6yo6y1moCF//BhGc72niOCUs2iMiRgRfcF9IGyKstZ+u/zQqjS+RcTwAJXFXy
	iuhdOEie6GRBdLNWbiXAgStwO1jb6aHU7oGZeXrBUqhvyXbAaLTrEj18N40UvgmycR39epxmr0CNh
	FZpRc55o2s6iaf3eR6T4bk/5j3m70Vbr3urwfCedbJ8nVpBqAg+9FJanWPIwETux/tFacgUggpkYr
	Dna5ig9A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBEp-00FReC-07;
	Wed, 18 Oct 2023 18:25:47 +0000
Date: Wed, 18 Oct 2023 11:25:46 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Yangbo Lu <yangbo.lu@nxp.com>, Joshua Kinard <kumba@gentoo.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	open list <linux-kernel@vger.kernel.org>, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-modules@vger.kernel.org
Subject: Re: [PATCH 5/5] modules: only allow symbol_get of EXPORT_SYMBOL_GPL
 modules
Message-ID: <ZTAjKv0FKAH+rePH@bombadil.infradead.org>
References: <20230801173544.1929519-1-hch@lst.de>
 <20230801173544.1929519-6-hch@lst.de>
 <bf555c2a4df5196533b6e614cc57638004dfb426.camel@infradead.org>
 <20231018053146.GA16765@lst.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018053146.GA16765@lst.de>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 18, 2023 at 07:31:46AM +0200, Christoph Hellwig wrote:
> On Wed, Oct 18, 2023 at 01:30:18AM +0100, David Woodhouse wrote:
> > 
> > But if we're going to tolerate the core kernel still exporting some
> > stuff with EXPORT_SYMBOL, why isn't OK for a GPL-licensed module do to
> > the same? Even an *in-tree* GPL-licensed module now can't export
> > functionality with EXPORT_SYMBOL and have it used with symbol_get().
> 
> Anything using symbol_get is by intent very deeply internal for tightly
> coupled modules working together, and thus not a non-GPL export.
> 
> In fact the current series is just a stepping stone.  Once some mess
> in the kvm/vfio integration is fixed up we'll require a new explicit
> EXPORT_SYMBOL variant as symbol_get wasn't ever intended to be used
> on totally random symbols not exported for use by symbol_get.

The later patches in the series also show we could resolves most
uses through Kconfig and at build time, it really begs the question
if we even need it for any real valid uses.

  Luis

